//
//  ExternalTool.h
//  Static
//
//  Created by evilpenguin.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXTERN NSString *const ExternalToolUnzip;
FOUNDATION_EXTERN NSString *const ExternalToolApktool;

@interface Tool : NSObject
@property (nonatomic, readonly) BOOL hasTool;
@property (nonatomic, readonly) NSString *path;
@property (class, nonatomic, readonly) NSString *path;
@property (nonatomic, readonly) NSArray<NSString *> *arguments;

- (NSError *) run;

@end

NS_ASSUME_NONNULL_END
