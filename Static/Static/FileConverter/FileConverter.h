//
//  FileConverter.h
//  Static
//
//  Created by evilpenguin.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FileConverter : NSObject

+ (BOOL) convertFileAtPath:(NSString *)path withData:(NSData *)data;

@end

NS_ASSUME_NONNULL_END
