//
//  FileExplorer.h
//  Static
//
//  Created by evilpenguin
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class Package;
@interface FileExplorer : NSObject

+ (void) explorePackage:(Package *)package block:(void(^)(NSString *path))block;

@end

NS_ASSUME_NONNULL_END
