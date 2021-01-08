//
//  NSString+Static.h
//  Static
//
//  Created by evilpenguin
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Helper)

- (BOOL) isNotEqualToString:(NSString *)string;
- (BOOL) containsInsensitiveString:(NSString *)insensitiveString;
- (BOOL) doesNotContainInsensitiveString:(NSString *)insensitiveString;
- (BOOL) containsAnyInsensitiveStrings:(NSArray<NSString *> *)insensitiveStrings;
- (BOOL) doesNotContainAnyInsensitiveStrings:(NSArray<NSString *> *)insensitiveStrings;

@end

NS_ASSUME_NONNULL_END
