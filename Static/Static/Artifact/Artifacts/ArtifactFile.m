//
//  ArtifactFile.m
//  Static
//
//  Created by evilpenguin.

#import "ArtifactFile.h"
#import "ArtifactWord.h"
#import "ArtifactMacho.h"

static NSString *ArtifactFilePathKey        = @"path";
static NSString *ArtifactFileFileNameKey    = @"file_name";
static NSString *ArtifactFileExtensionKey   = @"extension";
static NSString *ArtifactFileFileHashKey    = @"file_hash";
static NSString *ArtifactFileWordsKey       = @"words";
static NSString *ArtifactFileMachosKey      = @"macho";


@implementation ArtifactFile

#pragma mark - ArtifactFile

- (NSString *) description {
    NSMutableString *desc = super.description.mutableCopy;
    [desc appendString:[self runtimeDescription]];

    return desc.copy;
}

#pragma mark - Artifact

+ (id<Artifact>) artifactFromDictionary:(NSDictionary<NSString *,id> *)dictionary {
    ArtifactFile *artifact = [[ArtifactFile alloc] init];
    artifact.path = dictionary[ArtifactFilePathKey];
    artifact.fileName = dictionary[ArtifactFileFileNameKey];
    artifact.extension = dictionary[ArtifactFileExtensionKey];
    artifact.fileHash = dictionary[ArtifactFileFileHashKey];
    artifact.macho = [ArtifactMacho artifactFromDictionary:dictionary[ArtifactFileMachosKey]];
    
    NSMutableArray *words = [NSMutableArray array];
    for (NSDictionary *wordDictionary in dictionary[ArtifactFileWordsKey]) {
        ArtifactWord *word = [ArtifactWord artifactFromDictionary:wordDictionary];
        [words addObject:word];
    }
    artifact.words = words;

    return artifact;
}

- (NSDictionary<NSString *,id> *)dictionary {
    NSMutableDictionary<NSString *, id> *dictionary = [NSMutableDictionary dictionary];
    dictionary[ArtifactFilePathKey] = self.path;
    dictionary[ArtifactFileFileNameKey] = self.fileName;
    dictionary[ArtifactFileExtensionKey] = self.extension;
    dictionary[ArtifactFileFileHashKey] = self.fileHash;
    dictionary[ArtifactFileWordsKey] = self.words.arrayDictionary;
    dictionary[ArtifactFileMachosKey] = self.macho.dictionary;

    return dictionary; // should be a copy shhh :)
}

@end
