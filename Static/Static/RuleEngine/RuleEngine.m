//
//  RuleEngine.m
//  Static
//
//  Created by evilpenguin.
//

#import "RuleEngine.h"
#import "RuleWord.h"
#import "RuleMacho.h"

#import "ArtifactWord.h"
#import "ArtifactFile.h"
#import "ArtifactMacho.h"

@interface RuleEngine()
@property (nonatomic, strong) RuleWord *wordRule;

@end

@implementation RuleEngine

#pragma mark - RuleEngine

- (instancetype) init {
    if (self = [super init]) {
        
    }
    
    return self;
}

#pragma mark - Public

- (ArtifactFile *) checkForArtifactOnPath:(NSString *)filePath withData:(NSData *)data {
    // Check path
    NSArray<ArtifactWord *> *path = [self.wordRule checkStringForIssues:filePath];
    
    // Check file
    NSArray<ArtifactWord *> *file = [self.wordRule checkDataForIssues:data];
    
    // Check for mach-o
    ArtifactMacho *macho = nil;
    if ([FileExplorer isFileMacho:data.bytes length:data.length]) {
        macho = [RuleMacho checkMachoForArtifacts:data.bytes length:data.length wordRule:self.wordRule];
    }
    
    // Artifact
    ArtifactFile *artifact = nil;
    if (path.count || file.count || macho) {
        artifact = [[ArtifactFile alloc] init];
        artifact.path = filePath;
        artifact.fileName = filePath.lastPathComponent;
        artifact.extension = filePath.pathExtension;
        artifact.fileHash = [data sha256String];
        artifact.macho = macho;
        
        NSMutableArray *words = file.mutableCopy;
        [words addObjectsFromArray:path];
        artifact.words = words;
    }
    
    return artifact;
}

#pragma mark - Getters

- (RuleWord *) wordRule {
    if (!_wordRule) _wordRule = [[RuleWord alloc] init];
    
    return _wordRule;
}

@end
