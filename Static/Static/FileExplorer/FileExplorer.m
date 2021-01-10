//
//  FileExplorer.m
//  Static
//
//  Created by evilpenguin
//

#import "FileExplorer.h"
#import "Package.h"
#import <mach-o/loader.h>

@implementation FileExplorer

#pragma mark - FileExplorer

+ (void) explorePackage:(Package *)package block:(void(^)(NSString *path))block {
    if (!package || !block) return;
    
    // Convert
    NSString *path = package.directoryPath;
    for (NSString *file in [NSFileManager.defaultManager enumeratorAtPath:path]) {
        NSString *fullPath = [path stringByAppendingPathComponent:file];
        
        BOOL isDir = NO;
        [NSFileManager.defaultManager fileExistsAtPath:fullPath isDirectory:&isDir];
        
        if (!isDir) block(fullPath);
    }
}

+ (BOOL) isFilePlist:(const char *)file length:(size_t)length {
    if (file && length >= 6) {
        return memcmp(file, "bplist", 6);
    }
    
    return NO;
}

+ (BOOL) isFileMacho:(const char *)file length:(size_t)length {
    if (file && length >= sizeof(struct mach_header_64)) {
        struct mach_header_64 *header = ((struct mach_header_64 *)file);
        if (header) {
            uint32_t magic = header->magic;
            if (magic == MH_MAGIC_64 || magic == MH_MAGIC){
                return YES;
            }
        }
    }
    
    return NO;
}

@end
