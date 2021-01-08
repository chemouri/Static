//
//  RuleWord.h
//  Static
//
//  Created by evilpenguin.

#import <Foundation/Foundation.h>
#import "Rule.h"

NS_ASSUME_NONNULL_BEGIN

@class ArtifactWord;
@interface RuleWord : NSObject <Rule>

- (NSArray<ArtifactWord *> *) checkStringForIssues:(NSString *)string;
- (NSArray<ArtifactWord *> *) checkDataForIssues:(NSData *)data;

@end

NS_ASSUME_NONNULL_END
