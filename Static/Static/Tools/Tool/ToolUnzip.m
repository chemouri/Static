//
//  ToolUnzip.m
//  Static
//
//  Created by evilpenguin.
//

#import "ToolUnzip.h"

@interface ToolUnzip ()

@end

@implementation ToolUnzip

#pragma mark - Getters

+ (NSString *) path {
    return @"/usr/bin/unzip";
}

- (NSArray<NSString *> *) arguments {
    return @[@"-o", self.file, @"-d", self.destination];
}

@end
