//
//  RuleWord.m
//  Static
//
//  Created by evilpenguin.

#import "RuleWord.h"
#import "ArtifactWord.h"

@interface RuleWord()

@end

@implementation RuleWord

#pragma mark - Public

- (NSArray<ArtifactWord *> *) checkStringForIssues:(NSString *)string {
    NSMutableArray *containsWords = nil;
    
    if (string.length > 0) {
        containsWords = [NSMutableArray array];
        
        // Check path extensions
        NSString *pathExtension = string.pathExtension;
        if (pathExtension.length > 0) {
            if ([pathExtension doesNotContainAnyInsensitiveStrings:self.ignoredExtentions]) {
                for (NSString *extension in self.fileExtensions) {
                    if ([extension isEqualToString:pathExtension]) {
                        ArtifactWord *artifact = [[ArtifactWord alloc] init];
                        artifact.foundWord = extension;
                        artifact.line = string;
                        
                        [containsWords addObject:artifact];
                        break;
                    }
                }
            }
        }
        // Check string
        else {
            NSArray<NSString *> *lines = [string componentsSeparatedByCharactersInSet:NSCharacterSet.newlineCharacterSet];
            for (NSInteger i = 0; i < lines.count; i++) {
                NSString *line = lines[i];
                
                for (NSString *word in [line componentsSeparatedByCharactersInSet:NSCharacterSet.whitespaceCharacterSet]) {
                    if ([word doesNotContainAnyInsensitiveStrings:self.ignoredWords]) {
                        for (NSString *checkingWord in self.words) {
                            NSRange wordRange = [word rangeOfString:checkingWord options:NSCaseInsensitiveSearch];
                            if (wordRange.location != NSNotFound) {
                                ArtifactWord *artifact = [[ArtifactWord alloc] init];
                                artifact.foundWord = checkingWord;
                                artifact.line = word;
                                artifact.range = NSStringFromRange(wordRange);
                                artifact.lineNumber = @(i + 1);

                                [containsWords addObject:artifact];
                            }
                        }
                    }
                }
            }
        }
    }
    
    return containsWords;
}

- (NSArray<ArtifactWord *> *) checkDataForIssues:(NSData *)data {
    NSString *fileString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    return [self checkStringForIssues:fileString];
}

#pragma Private -

- (NSArray<NSString *> *) fileExtensions {
    static NSArray<NSString *> *array = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        array = @[@"sh",
                  @"xcconfig",
                  @"c",
                  @"cpp",
                  @"hpp",
                  @"swift",
                  @"java",
                  @"kt",
                  @"m",
                  @"mm",
                  @"shell",
                  @"keystore",
                  @"pdf",
                  @"xlsx",
                  @"xls",
                  @"csv",
                  @"py",
                  @"psd",
                  @"pfx",
                  @"ipa",
                  @"app",
                  @"doc",
                  @"docx",
                  @"cer",
                  @"ds_store",
                  @"der",
                  @"p12",
                  @"xcfilelist",
                  @"podspec",
                  @"md",
                  @"txt",
                  @"text",
                  @"exe",
                  @"bin",
                  @"sketch",
                  @"md",
                  @"aspx",
                  @"cs",
                  @"html",
                  @"js"];
    });
    
    return array;
}

- (NSArray<NSString *> *) words {
    static NSArray<NSString *> *array = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        array = @[@"git",
                  @"qa",
                  @"stage",
                  @"stg",
                  @"preprod",
                  @"debug",
                  @"secret",
                  @"test",
                  @"http://",
                  @"SHA-1",
                  @"mock"];
    });
    
    return array;
}

#pragma mark - Private (ignored)

- (NSArray<NSString *> *) ignoredWords {
    static NSArray<NSString *> *array = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        array = @[@"http://schemas.android.com",
                  @"http://www.apple.com/DTDs/PropertyList-1.0.dtd",
                  @"http://www.ximian.com",
                  @"http://schemas.xmlsoap.org",
                  @"http://www.w3.org",
                  @"UIDeviceFamily",
                  @"CFBundleDevelopmentRegion",
                  @"UIRequiredDeviceCapabilities"];
    });
    
    return array;
}

- (NSArray<NSString *> *) ignoredExtentions {
    static NSArray<NSString *> *array = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        array = @[@"decompiled-classes",
                  @"_CodeSignature",
                  @"CodeResources",
                  @"Localizable",
                  @"META-INF/CERT.SF",
                  @"META-INF/MANIFEST.MF",
                  @"apktool.yml"];
    });
    
    return array;
}

@end
