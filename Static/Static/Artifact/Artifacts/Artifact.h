//
//  ArtifactProtocol.h
//  Static
//
//  Created by evilpenguin
//

@protocol Artifact <NSObject>

+ (id<Artifact>) artifactFromDictionary:(NSDictionary<NSString *, id> *)dictionary;
- (NSDictionary<NSString *, id> *) dictionary;

@end
