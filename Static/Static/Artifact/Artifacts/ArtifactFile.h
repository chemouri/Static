//
//  ArtifactFile.h
//  Static
//
//  Created by evilpenguin.

#import <Foundation/Foundation.h>
#import "Artifact.h"

NS_ASSUME_NONNULL_BEGIN

@class ArtifactWord, ArtifactMacho;
@interface ArtifactFile : NSObject <Artifact>
@property (nonatomic, strong) NSString *path;
@property (nonatomic, strong) NSString *fileName;
@property (nonatomic, strong) NSString *extension;
@property (nonatomic, strong) NSString *fileHash;
@property (nonatomic, strong) NSArray<ArtifactWord *> *words;
@property (nonatomic, strong) ArtifactMacho *macho;

@end

NS_ASSUME_NONNULL_END
