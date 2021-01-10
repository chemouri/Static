//
//  NSArray+Static.m
//  Static
//
//  Created by evilpenguin
//

#import "NSArray+Static.h"
#import "Artifact.h"

@implementation NSArray (Static)

#pragma mark - NSArray (Static)

- (NSArray<NSDictionary *> *) arrayDictionary {
    NSMutableArray<NSDictionary *> *array = [NSMutableArray arrayWithCapacity:self.count];
    
    for (id<Artifact> artifact in self) {
        [array addObject:artifact.dictionary];
    }
    
    return array; // should be a copy but shh
}

@end
