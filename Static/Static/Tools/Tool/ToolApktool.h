//
//  ToolApktool.h
//  static
//
//  Created by evilpenguin.

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface ToolApktool : Tool
@property (nonatomic, strong) NSString *file;
@property (nonatomic, strong) NSString *destination;

@end

NS_ASSUME_NONNULL_END
