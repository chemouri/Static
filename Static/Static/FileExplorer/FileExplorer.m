//
//  FileExplorer.m
//  Static
//
//  Created by evilpenguin
//

#import "FileExplorer.h"
#import "Package.h"

@implementation FileExplorer

#pragma mark - FileExplorer

+ (void) explorePackage:(Package *)package block:(void(^)(NSString *path))block {
    if (!package || !block) return;
    
    // Convert
    NSString *path = package.directoryPath;
    for (NSString *file in [NSFileManager.defaultManager enumeratorAtPath:path]) {
        NSString *fullPath = [path stringByAppendingPathComponent:file];
        
        BOOL isDir = NO;
        [NSFileManager.defaultManager fileExistsAtPath:fullPath isDirectory:&isDir];
        
        if (!isDir) block(fullPath);
    }
}

@end
