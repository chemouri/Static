//
//  ExternalTools.m
//  Static
//
//  Created by evilpenguin.
//

#import "ExternalTools.h"


@implementation ExternalTools

+ (BOOL) hasTools {
    NSArray<NSString *> *tools = @[
        ToolUnzip.path,
        ToolPlutil.path,
        ToolApktool.path,
    ];
    
    NSMutableArray<NSString *> *missingTools = [NSMutableArray arrayWithCapacity:tools.count];
    for (NSString *tool in tools) {
        if (![NSFileManager.defaultManager fileExistsAtPath:tool]) {
            [missingTools addObject:tool];
        }
    }

    return missingTools.count == 0;
}

+ (void) printRequiredTools {
    printf("required tools:");
    printf("\n%-20s %s" , "unzip", ToolUnzip.path.UTF8String);
    printf("\n%-20s %s" , "plutil", ToolPlutil.path.UTF8String);
    printf("\n%-20s %s" , "apktool", ToolApktool.path.UTF8String);
    
    printf("\n\n");
}

@end
