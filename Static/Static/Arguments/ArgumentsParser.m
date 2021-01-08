//
//  ArgumentsParser.m
//  Static
//
//  Created by evilpenguin
//

#import "ArgumentsParser.h"

@implementation ArgumentsParser

+ (Arguments *) parseArgumentsFromArray:(const char **)array withCount:(int)count {
    Arguments *arguments = [[Arguments alloc] init];
    
    if (array) {
        for (int i = 0; i < count; i++) {
            NSString *value = [NSString stringWithCString:array[i] encoding:NSUTF8StringEncoding];
            
            if ([self _isHelp:value]) {
                arguments.help = YES;
                break;
            }
            else {
                if ([value rangeOfString:@"-path" options:NSCaseInsensitiveSearch].location != NSNotFound)          arguments.path = [self _pathStringFromCString:array[++i]];
                else if ([value rangeOfString:@"-output" options:NSCaseInsensitiveSearch].location != NSNotFound)   arguments.outputPath = [self _pathStringFromCString:array[++i]];
            }
        }
    }
    
    return arguments;
}

#pragma mark - Private

+ (BOOL) _isHelp:(NSString *)string {
    NSRange helpRange = [string rangeOfString:@"-help" options:NSCaseInsensitiveSearch];
    NSRange hRange = [string rangeOfString:@"-h" options:NSCaseInsensitiveSearch];
    
    return helpRange.location != NSNotFound || hRange.location != NSNotFound;
}

+ (NSString *) _pathStringFromCString:(const char *)cString {
    NSString *string = [NSString stringWithCString:cString encoding:NSUTF8StringEncoding];
    string = [string stringByReplacingOccurrencesOfString:@"\\" withString:@""];

    if ([string rangeOfString:@"/"].location == NSNotFound) {
        string = [NSString stringWithFormat:@"%@/%@", NSFileManager.defaultManager.currentDirectoryPath, string];
    }

    return string.stringByExpandingTildeInPath;
}

@end

