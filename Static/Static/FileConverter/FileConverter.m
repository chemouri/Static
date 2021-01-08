//
//  FileConverter.m
//  Static
//
//  Created by evilpenguin.
//

#import "FileConverter.h"

@implementation FileConverter

#pragma mark - FileConverter

+ (BOOL) convertFileAtPath:(NSString *)path withData:(NSData *)data {
    // Plist
    BOOL isPlist = memcmp(data.bytes, "bplist", 6) == 0;
    if (isPlist) [self _convertPlistToXmlAtPath:path];
    
    return isPlist;
}

#pragma mark - Private

+ (void) _convertPlistToXmlAtPath:(NSString *)plistPath {
    if (plistPath.length > 0) {
        ToolPlutil *tool = [[ToolPlutil alloc] init];
        tool.file = plistPath;
        [tool run];
    }
}

@end
