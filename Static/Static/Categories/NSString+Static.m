//
//  NSString+Static.m
//  Static
//
//  Created by evilpenguin
//

#import "NSString+Static.h"

@implementation NSString (Helper)

#pragma mark - Public methods

- (BOOL) isNotEqualToString:(NSString *)string {
    return ![self isEqualToString:string];
}

- (BOOL) containsInsensitiveString:(NSString *)insensitiveString {
    return [self rangeOfString:insensitiveString options:NSCaseInsensitiveSearch].location != NSNotFound;
}

- (BOOL) doesNotContainInsensitiveString:(NSString *)insensitiveString {
    return [self rangeOfString:insensitiveString options:NSCaseInsensitiveSearch].location == NSNotFound;
}

- (BOOL) containsAnyInsensitiveStrings:(NSArray<NSString *> *)insensitiveStrings {
    for (NSString *string in insensitiveStrings) {
        if ([self containsInsensitiveString:string]) {
            return YES;
        }
    }
    
    return NO;
}

- (BOOL) doesNotContainAnyInsensitiveStrings:(NSArray<NSString *> *)insensitiveStrings {
    return [self containsAnyInsensitiveStrings:insensitiveStrings] == NO;
}

@end
