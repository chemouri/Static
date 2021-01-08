//
//  ArtifactFile.m
//  Static
//
//  Created by evilpenguin.

#import "ArtifactFile.h"
#import "ArtifactWord.h"

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
    artifact.path = dictionary[@""];
    artifact.fileName = dictionary[@""];
    artifact.fileHash = dictionary[@""];
    
    NSMutableArray *words = [NSMutableArray array];
    for (NSDictionary *wordDictionary in dictionary[@""]) {
        ArtifactWord *word = [ArtifactWord artifactFromDictionary:wordDictionary];
        [words addObject:word];
    }
    artifact.words = words;

    return artifact;
}

- (NSDictionary<NSString *,id> *)dictionary {
    NSMutableDictionary<NSString *, id> *dictionary = [NSMutableDictionary dictionary];
    dictionary[@"path"] = self.path;
    dictionary[@"file_name"] = self.fileName;
    dictionary[@"file_hash"] = self.fileHash;
    
    NSMutableArray *words = [NSMutableArray arrayWithCapacity:self.words.count];
    for (id<Artifact> artifact in self.words) {
        [words addObject:artifact.dictionary];
    }
    dictionary[@"words"] = words;

    return dictionary; // should be a copy shhh :)
}

@end
