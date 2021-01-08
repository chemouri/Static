//
//  Outputter.m
//  Static
//
//  Created by evilpenguin.

#import "Outputter.h"
#import "ArtifactContainer.h"
#import "Package.h"

@implementation Outputter

#pragma mark - Outputter

+ (void) outputArtifacts:(ArtifactContainer *)container package:(Package *)package toPath:(NSString *)path {
    NSMutableDictionary *output = [NSMutableDictionary dictionary];
    
    // Package
    output[@"package"] = package.dictionary;
    
    // Artifacts
    NSArray<NSDictionary *> *dictionary = container.artifacts.dictionary;
    if (dictionary.count > 0) {
        output[@"artifacts"] = dictionary;
    }
    
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:output options:NSJSONWritingPrettyPrinted error:&error];
    [jsonData writeToFile:path atomically:YES];
}

@end
