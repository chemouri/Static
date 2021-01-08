//
//  PackageCreator.h
//  Static
//
//  Created by evilpenguin
//

#import <Foundation/Foundation.h>
#import "Package.h"

NS_ASSUME_NONNULL_BEGIN

@class Arguments;
@interface PackageCreator : NSObject

+ (Package *) createPackageFromArguments:(Arguments *)arguments;

@end

NS_ASSUME_NONNULL_END
