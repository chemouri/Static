//
//  RuleBinary.h
//  static
//
//  Created by evilpenguin.
//

#import "Rule.h"

NS_ASSUME_NONNULL_BEGIN

@class ArtifactMacho, RuleWord;
@interface RuleMacho : NSObject <Rule>

+ (ArtifactMacho *) checkMachoForArtifacts:(const char *)macho length:(size_t)length wordRule:(RuleWord *)wordRule;

@end

NS_ASSUME_NONNULL_END
