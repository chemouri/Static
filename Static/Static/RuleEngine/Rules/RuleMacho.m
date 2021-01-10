//
//  RuleBinary.m
//  static
//
//  Created by evilpenguin.
//

#import "RuleMacho.h"
#import <mach-o/loader.h>
#import <mach-o/nlist.h>
#import "ArtifactMacho.h"
#import "RuleWord.h"

@implementation RuleMacho

#pragma mark - Public

+ (ArtifactMacho *) checkMachoForArtifacts:(const char *)macho length:(size_t)length wordRule:(RuleWord *)wordRule {
    ArtifactMacho *artifact = nil;
    
    if (macho && length >= sizeof(struct mach_header)) {
        struct mach_header *header = ((struct mach_header *)macho);
        if (header) {
            artifact = [[ArtifactMacho alloc] init];
            
            // Check for MH_PIE
            uint32_t flags = header->flags;
            artifact.hasPIE = (flags & MH_PIE) != 0;

            // Strings
            struct symtab_command *symtabCommad = NULL;
            
            // Dump LC_LOAD_DYLIB
            uint32_t magic_number = header->magic;
            size_t sizeOffset = (magic_number == MH_MAGIC ? sizeof(struct mach_header) : sizeof(struct mach_header_64));
            
            struct load_command *loadCommand = (struct load_command *)((unsigned char *)header + sizeOffset);
            for (int i = 0; i < header->ncmds; i++) {
                uint32_t command = loadCommand->cmd;
                
                if (command == LC_LOAD_DYLIB) {
                    struct dylib_command *dylibCommand = (struct dylib_command *)loadCommand;
                    if (dylibCommand) {
                        struct dylib dylib = dylibCommand->dylib;
                        [artifact.libraries addObject:[NSString stringWithUTF8String:(const char *)dylibCommand + dylib.name.offset]];
                    }
                }
                else if (command == LC_SYMTAB) {
                    symtabCommad = (struct symtab_command *)loadCommand;
                }
                
                loadCommand = (struct load_command *)((unsigned char *)loadCommand + loadCommand->cmdsize);
            }
            
            // Dump LC_SYMTAB
            if (symtabCommad) {
                NSMutableSet<NSString *> *strings = [NSMutableSet set];
                
                // Dump strings
                uint32_t strsize = symtabCommad->strsize;
                uint8_t *stringTable = (uint8_t *)header + symtabCommad->stroff;
                
                uint32_t readSize = 0;
                uint8_t *string = stringTable;
                while (readSize < strsize) {
                    size_t length = strlen((const char *)string) + 1;
                    if (length > 1) [strings addObject:[NSString stringWithUTF8String:(const char *)string]];
                    
                    readSize += length;
                    string = string + length;
                }
                
                // Dump symbols
                struct nlist_64 *symbol = (struct nlist_64 *)((unsigned char *)header + symtabCommad->symoff);
                for (int i = 0; i < symtabCommad->nsyms; i++) {
                    uint32_t index = symbol->n_un.n_strx;
                    if (index > 0) {
                        uint8_t *symbolString = (uint8_t *)stringTable + index;
                        [strings addObject:[NSString stringWithUTF8String:(const char *)symbolString]];
                    }
                    
                    symbol = (struct nlist_64 *)((unsigned char *)symbol + sizeof(struct nlist_64));
                }
                
                // Check strings to words
                NSMutableArray<ArtifactWord *> *words = (strings.count > 0 ? [NSMutableArray array] : nil);
                for (NSString *word in strings) {
                    NSArray<ArtifactWord *> *foundWords = [wordRule checkStringForIssues:word];
                    [words addObjectsFromArray:foundWords];
                }
                artifact.words = words;
            }
        }
    }
    
    return artifact;
}


@end
