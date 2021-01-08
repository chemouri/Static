//
//  Package.h
//  Static
//
//  Created by evilpenguin
//

#import <Foundation/Foundation.h>
#import "Artifact.h"

typedef NS_OPTIONS(NSInteger, PackageType) {
    PackageTypeUnknown     = 0x00,
    PackageTypeiOS         = 0x01 << 0x00,  // IPA
    PackageTypeAndroid     = 0x01 << 0x01,  // APK
};

NS_ASSUME_NONNULL_BEGIN

@interface Package : NSObject <Artifact>
@property (nonatomic, assign) PackageType type;
@property (nonatomic, strong) NSString *path;
@property (nonatomic, strong) NSString *directoryPath;
@property (nonatomic, strong) NSString *packageHash;

- (void) unzip;

@end

NS_ASSUME_NONNULL_END
