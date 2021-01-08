//
//  PlutilTool.m
//  Static
//
//  Created by evilpenguin.
//

#import "ToolPlutil.h"

@implementation ToolPlutil

#pragma mark - Getters

+ (NSString *) path {
    return @"/usr/bin/plutil";
}

- (NSArray<NSString *> *) arguments {
    return  @[@"-convert", @"xml1", self.file];
}

@end
