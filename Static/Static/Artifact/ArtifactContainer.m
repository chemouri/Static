//
//  ArtifactContainer.m
//  Static
//
//  Created by evilpenguin.
//

#import "ArtifactContainer.h"

@interface ArtifactContainer ()
@property (nonatomic, strong) NSMutableArray<id<Artifact>> *_artifacts;

@end

@implementation ArtifactContainer

#pragma mark - Public

- (void) addArtifacts:(NSArray<id<Artifact>> *)artifacts {
    [self._artifacts addObjectsFromArray:artifacts];
}

- (void) addArtifact:(id<Artifact>)artifact {
    [self._artifacts addObject:artifact];
}

- (NSArray<id<Artifact>> *) artifacts {
    return self._artifacts;
}

#pragma mark - Getters

- (NSMutableArray *) _artifacts {
    if (!__artifacts) __artifacts = [NSMutableArray array];
    
    return __artifacts;
}

@end
