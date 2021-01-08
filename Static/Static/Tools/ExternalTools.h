//
//  ExternalTools.h
//  Static
//
//  Created by evilpenguin.
//

#import <Foundation/Foundation.h>
#import "ToolUnzip.h"
#import "ToolPlutil.h"
#import "ToolApktool.h"

NS_ASSUME_NONNULL_BEGIN

@interface ExternalTools : NSObject

+ (BOOL) hasTools;
+ (void) printRequiredTools;

@end

NS_ASSUME_NONNULL_END
