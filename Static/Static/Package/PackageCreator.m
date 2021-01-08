//
//  PackageCreator.m
//  Static
//
//  Created by evilpenguin
//

#import "PackageCreator.h"
#import "Arguments.h"

@implementation PackageCreator

#pragma mark - Public

+ (Package *) createPackageFromArguments:(Arguments *)arguments {
    Package *package = [[Package alloc] init];
    package.path = arguments.path;
    package.packageHash = [self _packageHashForPath:arguments.path];
    
    return package;
}

#pragma mark - Private

+ (NSString *) _packageHashForPath:(NSString *)path {
    NSData *data = [NSData dataWithContentsOfFile:path.stringByExpandingTildeInPath];

    return [data sha256String];
}

@end
