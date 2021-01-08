//
//  ArtifactContainer.h
//  Static
//
//  Created by evilpenguin.
//

#import <Foundation/Foundation.h>

#import "Artifact.h"
#import "ArtifactFile.h"
#import "ArtifactWord.h"

NS_ASSUME_NONNULL_BEGIN

@interface ArtifactContainer : NSObject

- (void) addArtifacts:(NSArray<id<Artifact>> *)artifacts;
- (void) addArtifact:(id<Artifact>)artifact;
- (NSArray<id<Artifact>> *) artifacts;

@end

NS_ASSUME_NONNULL_END
