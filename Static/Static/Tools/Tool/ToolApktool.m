//
//  ToolApktool.m
//  static
//
//  Created by evilpenguin.

#import "ToolApktool.h"

@implementation ToolApktool

#pragma mark - Getters

+ (NSString *) path {
    return @"/usr/local/bin/apktool";
}

- (NSArray<NSString *> *) arguments {
    return  @[@"d", @"-f", @"-o", self.destination, self.file];
}

@end
