//
//  ArtifactWord.m
//  Static
//
//  Created by evilpenguin.

#import "ArtifactWord.h"

@implementation ArtifactWord

#pragma mark - ArtifactWord

- (NSString *) description {
    NSMutableString *desc = super.description.mutableCopy;
    [desc appendString:[self runtimeDescription]];

    return desc.copy;
}

#pragma mark - Artifact

+ (id<Artifact>) artifactFromDictionary:(NSDictionary<NSString *,id> *)dictionary {
    ArtifactWord *artifact = [[ArtifactWord alloc] init];
    artifact.word = dictionary[@""];
    artifact.callout = dictionary[@""];
    artifact.foundWord = dictionary[@""];
    artifact.range = dictionary[@""];
    artifact.line = dictionary[@""];
    
    return artifact;
}

- (NSDictionary<NSString *,id> *)dictionary {
    NSMutableDictionary<NSString *, id> *dictionary = [NSMutableDictionary dictionary];
    dictionary[@"word"] = self.word;
    dictionary[@"callout"] = self.callout;
    dictionary[@"found_word"] = self.foundWord;
    dictionary[@"range"] = self.range;
    dictionary[@"line"] = self.line;
    
    return dictionary; // should be a copy shhh :)
}

@end
