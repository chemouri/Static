//
//  NSData+Static.m
//  Static
//
//  Created by evilpenguin
//

#import "NSData+Static.h"

#import <CommonCrypto/CommonHMAC.h>

@implementation NSData (Hash)

#pragma mark - Public methods

- (NSString *) sha256String {
    uint8_t digest[CC_SHA256_DIGEST_LENGTH] = {};
    CC_SHA256(self.bytes, (unsigned int)self.length, digest);
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA256_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_SHA256_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", digest[i]];
    }
    
    return output.copy;
}

@end
