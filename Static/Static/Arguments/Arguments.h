//
//  Arguments.h
//  Static
//
//  Created by evilpenguin
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Arguments : NSObject
@property (nonatomic, strong) NSString *path;
@property (nonatomic, strong) NSString *outputPath;
@property (nonatomic, assign) BOOL help;
@property (nonatomic, assign) BOOL version;

- (BOOL) isValid;
- (void) printHelp;

@end

NS_ASSUME_NONNULL_END
