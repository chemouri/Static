//
//  ArtifactWord.h
//  Static
//
//  Created by evilpenguin.

#import <Foundation/Foundation.h>
#import "Artifact.h"

NS_ASSUME_NONNULL_BEGIN

@interface ArtifactWord : NSObject<Artifact>
@property (nonatomic, strong) NSString *line;
@property (nonatomic, strong) NSString *callout;
@property (nonatomic, strong) NSString *foundWord;
@property (nonatomic, strong) NSString *range;
@property (nonatomic, strong) NSNumber *lineNumber;

@end

NS_ASSUME_NONNULL_END
