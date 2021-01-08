//
//  Package.m
//  Static
//
//  Created by evilpenguin
//

#import "Package.h"

static NSString *PackagePathKey     = @"path";
static NSString *PackageDirPathKey  = @"dir_path";
static NSString *PackageHashKey     = @"package_hash";

@implementation Package

#pragma mark - Package

- (NSString *) description {
    NSMutableString *desc = super.description.mutableCopy;
    [desc appendString:[self runtimeDescription]];

    return desc.copy;
}

#pragma mark - Public

- (void) unzip {
    switch (self.type) {
        case PackageTypeUnknown:
            break;
        case PackageTypeiOS: {
            // Unzip
            ToolUnzip *unzip = [[ToolUnzip alloc] init];
            unzip.file = self.path;
            unzip.destination = self.path.stringByDeletingLastPathComponent;
            [unzip run];
            
            // Directory path
            NSString *payloadPath = [unzip.destination stringByAppendingPathComponent:@"Payload"];
            for (NSString *file in  [NSFileManager.defaultManager enumeratorAtPath:payloadPath]) {
                if ([file.pathExtension containsInsensitiveString:@"app"]) {
                    self.directoryPath = [payloadPath stringByAppendingPathComponent:file];
                    break;
                }
            }
            
            break;
        }
        case PackageTypeAndroid: {
            // Apktool
            ToolApktool *apktool = [[ToolApktool alloc] init];
            apktool.file = self.path;
            apktool.destination = self.path.stringByDeletingPathExtension;
            [apktool run];
            
            // Directory path
            self.directoryPath = apktool.destination;
            
            break;
        }
    }
}

#pragma mark - Setter

- (void) setPath:(NSString *)path {
    _path = path;
    
    if (_path.length > 0) {
        [self _setTypeFromPath];
    }
}

#pragma mark - Private

- (void) _setTypeFromPath {
    NSString *extension = self.path.pathExtension;
    
    if ([extension containsInsensitiveString:@"ipa"]) _type = PackageTypeiOS;
    else if ([extension containsInsensitiveString:@"apk"]) _type = PackageTypeAndroid;
    else _type = PackageTypeUnknown;
}

#pragma mark - Artifact

+ (id<Artifact>) artifactFromDictionary:(NSDictionary<NSString *,id> *)dictionary {
    Package *package = [[Package alloc] init];
    package.path = dictionary[PackagePathKey];
    package.directoryPath = dictionary[PackageDirPathKey];
    package.packageHash = dictionary[PackageHashKey];

    return package;
}

- (NSDictionary<NSString *,id> *)dictionary {
    NSMutableDictionary<NSString *, id> *dictionary = [NSMutableDictionary dictionary];
    dictionary[@"path"] = self.path;
    dictionary[@"dir_path"] = self.directoryPath;
    dictionary[@"packageHash"] = self.packageHash;

    return dictionary; // should be a copy shhh :)
}

@end
