//
//  Outputter.h
//  Static
//
//  Created by evilpenguin.

#import <Foundation/Foundation.h>
#import "Artifact.h"

NS_ASSUME_NONNULL_BEGIN

@class ArtifactContainer, Package;
@interface Outputter : NSObject

+ (void) outputArtifacts:(ArtifactContainer *)container package:(Package *)package toPath:(NSString *)path;

@end

NS_ASSUME_NONNULL_END
