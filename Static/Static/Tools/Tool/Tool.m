//
//  ExternalTool.m
//  Static
//
//  Created by evilpenguin.
//

#import "Tool.h"

@implementation Tool

#pragma mark - Public

- (NSError *) run {
    NSTask *task = [[NSTask alloc] init];
    [task setExecutablepPath:self.path];
    task.arguments = self.arguments;
    task.standardOutput = nil;
    task.standardError = nil;
    
    NSError *error = nil;
    [task launchTaskWithError:&error];
    [task waitUntilExit];
    
    return error;
}

#pragma mark - Getters

- (BOOL) hasTool {
    return [NSFileManager.defaultManager fileExistsAtPath:self.path];
}

- (NSString *) path {
    return self.class.path;
}

+ (NSString *) path {
    return nil;
}


- (NSArray<NSString *> *) arguments {
    return nil;
}

@end
