//
//  NSTask+Static.h
//  Static
//
//  Created by evilpenguin
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSTask (Static)

- (void) setExecutablepPath:(NSString *)path;
- (BOOL) launchTaskWithError:(NSError **)error;

@end

NS_ASSUME_NONNULL_END
