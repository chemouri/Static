//
//  ToolUnzip.h
//  Static
//
//  Created by evilpenguin.
//

#import <Foundation/Foundation.h>
#import "Tool.h"

NS_ASSUME_NONNULL_BEGIN

@interface ToolUnzip : Tool
@property (nonatomic, strong) NSString *file;
@property (nonatomic, strong) NSString *destination;

@end

NS_ASSUME_NONNULL_END
