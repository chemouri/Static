//
//  NSTask+Static.m
//  Static
//
//  Created by evilpenguin
//

#import "NSTask+Static.h"
#import <AppKit/AppKit.h>

@implementation NSTask (Static)

#pragma mark - Public methods

- (void) setExecutablepPath:(NSString *)path {
    if (NSAppKitVersionNumber >= NSAppKitVersionNumber10_13) {
        if (@available(macOS 10.13, *)) self.executableURL = [NSURL fileURLWithPath:path];
    }
    else self.launchPath = path;
}

- (BOOL) launchTaskWithError:(NSError **)error {
    if (NSAppKitVersionNumber >= NSAppKitVersionNumber10_13) {
        if (@available(macOS 10.13, *)) return [self launchAndReturnError:error];
    }
    
    [self launch];
    
    return YES;
}

@end
