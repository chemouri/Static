//
//  ArtifactBinary.m
//  static
//
//  Created by evilpenguin.
//

#import "ArtifactMacho.h"
#import "ArtifactWord.h"

static NSString *ArtifactMachoPieKey        = @"pie";
static NSString *ArtifactMachoLibrariesKey  = @"libraries";
static NSString *ArtifactMachoWordsKey      = @"words";


@implementation ArtifactMacho

#pragma mark - ArtifactMacho

- (NSString *) description {
    NSMutableString *desc = super.description.mutableCopy;
    [desc appendString:[self runtimeDescription]];

    return desc.copy;
}

#pragma mark - Getters

- (NSMutableArray<NSString *> *) libraries {
    if (!_libraries) _libraries = [NSMutableArray array];
    
    return _libraries;
}

#pragma mark - Artifact

+ (id<Artifact>) artifactFromDictionary:(NSDictionary<NSString *,id> *)dictionary {
    ArtifactMacho *artifact = [[ArtifactMacho alloc] init];
    artifact.hasPIE = [dictionary[ArtifactMachoPieKey] boolValue];
    artifact.libraries = dictionary[ArtifactMachoLibrariesKey];
    
    NSMutableArray *words = [NSMutableArray array];
    for (NSDictionary *wordDictionary in dictionary[ArtifactMachoWordsKey]) {
        ArtifactWord *word = [ArtifactWord artifactFromDictionary:wordDictionary];
        [words addObject:word];
    }
    artifact.words = words;
    
    return artifact;
}

- (NSDictionary<NSString *,id> *)dictionary {
    NSMutableDictionary<NSString *, id> *dictionary = [NSMutableDictionary dictionary];
    dictionary[ArtifactMachoPieKey] = @(self.hasPIE);
    dictionary[ArtifactMachoLibrariesKey] = self.libraries;
    dictionary[ArtifactMachoWordsKey] = self.words.arrayDictionary;

    return dictionary; // should be a copy shhh :)
}

@end
