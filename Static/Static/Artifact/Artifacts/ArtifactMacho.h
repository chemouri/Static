//
//  ArtifactBinary.h
//  static
//
//  Created by evilpenguin.
//

#import <Foundation/Foundation.h>
#import "Artifact.h"

NS_ASSUME_NONNULL_BEGIN

@class ArtifactWord;
@interface ArtifactMacho : NSObject <Artifact>
@property (nonatomic, assign) BOOL hasPIE;
@property (nonatomic, strong) NSMutableArray<NSString *> *libraries;
@property (nonatomic, strong) NSArray<ArtifactWord *> *words;

@end

NS_ASSUME_NONNULL_END
