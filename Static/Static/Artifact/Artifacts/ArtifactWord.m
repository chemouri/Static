//
//  ArtifactWord.m
//  Static
//
//  Created by evilpenguin.

#import "ArtifactWord.h"

static NSString *ArtifactWordLineKey        = @"line";
static NSString *ArtifactWordCalloutKey     = @"callout";
static NSString *ArtifactWordFoundWorkKey   = @"found_word";
static NSString *ArtifactWordRangeKey       = @"range";
static NSString *ArtifactWordLineNumberKey  = @"line_number";

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
    artifact.line = dictionary[ArtifactWordLineKey];
    artifact.callout = dictionary[ArtifactWordCalloutKey];
    artifact.foundWord = dictionary[ArtifactWordFoundWorkKey];
    artifact.range = dictionary[ArtifactWordRangeKey];
    artifact.lineNumber = dictionary[ArtifactWordLineNumberKey];
    
    return artifact;
}

- (NSDictionary<NSString *,id> *)dictionary {
    NSMutableDictionary<NSString *, id> *dictionary = [NSMutableDictionary dictionary];
    dictionary[ArtifactWordLineKey] = self.line;
    dictionary[ArtifactWordCalloutKey] = self.callout;
    dictionary[ArtifactWordFoundWorkKey] = self.foundWord;
    dictionary[ArtifactWordRangeKey] = self.range;
    dictionary[ArtifactWordLineNumberKey] = self.lineNumber;
    
    return dictionary; // should be a copy shhh :)
}

@end
