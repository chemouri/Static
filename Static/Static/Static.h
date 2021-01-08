//
//  Static.h
//  Static
//
//  Created by evilpenguin
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Static : NSObject

- (instancetype) initWithArgs:(const char *_Nullable *_Nullable)array count:(int)count;
- (BOOL) isReady;
- (void) printHelp;
- (void) start;

@end

NS_ASSUME_NONNULL_END
