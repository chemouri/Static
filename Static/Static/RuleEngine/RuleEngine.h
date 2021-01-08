//
//  RuleEngine.h
//  Static
//
//  Created by evilpenguin.
//

#import <Foundation/Foundation.h>
#import "Artifact.h"

NS_ASSUME_NONNULL_BEGIN

@class ArtifactFile;
@interface RuleEngine : NSObject

- (ArtifactFile *) checkForArtifactOnPath:(NSString *)filePath withData:(NSData *)data;

@end

NS_ASSUME_NONNULL_END
