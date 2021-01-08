//
//  ArtifactFile.h
//  Static
//
//  Created by evilpenguin.

#import <Foundation/Foundation.h>
#import "Artifact.h"

NS_ASSUME_NONNULL_BEGIN

@class ArtifactWord;
@interface ArtifactFile : NSObject<Artifact>
@property (nonatomic, strong) NSString *path;
@property (nonatomic, strong) NSString *fileName;
@property (nonatomic, strong) NSString *fileHash;
@property (nonatomic, strong) NSArray<ArtifactWord *> *words;

@end

NS_ASSUME_NONNULL_END
