//
//  Arguments.m
//  Static
//
//  Created by evilpenguin
//

#import "Arguments.h"
#import "NSObject+Static.h"

@implementation Arguments

#pragma mark - Arguments

- (instancetype) init {
    if (self = [super init]) {
        self.help       = NO;
        self.version    = NO;
    }
    
    return self;
}

- (NSString *) description {
    NSMutableString *desc = super.description.mutableCopy;
    [desc appendString:[self runtimeDescription]];

    return desc.copy;
}

#pragma mark - Public

- (BOOL) isValid {
    BOOL isValid = YES;
    isValid &= self.path.length > 0 && [NSFileManager.defaultManager fileExistsAtPath:self.path isDirectory:nil];
    isValid &= self.outputPath.length > 0;
    isValid &= !self.help;
    
    return isValid;
}

- (void) printHelp {
    printf("usage: static -path PATH_TO_APP -output PATH_TO_JSON_OUTPUT_FILE");
    printf("\n");
    printf("\nrequired arguments:");
    printf("\n%-20s %s" , "-path $PATH", "the $PATH to the app (IPA and APK).");
    printf("\n%-20s %s" , "-output $PATH", "the $PATH output where the JSON file is written.");

    printf("\n\n");
}

@end
