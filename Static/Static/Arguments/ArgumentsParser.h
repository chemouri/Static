//
//  ArgumentsParser.h
//  Static
//
//  Created by evilpenguin
//

#import <Foundation/Foundation.h>
#import "Arguments.h"

NS_ASSUME_NONNULL_BEGIN

@interface ArgumentsParser : NSObject

+ (Arguments *) parseArgumentsFromArray:(const char *_Nullable *_Nullable)array withCount:(int)count;

@end

NS_ASSUME_NONNULL_END
