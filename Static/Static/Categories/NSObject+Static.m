//
//  NSObject (Static).m
//  Static
//
//  Created by evilpenguin
//

#import "NSObject+Static.h"
@import ObjectiveC.runtime;

@implementation NSObject (Static)

#pragma mark -  NSObject (Static)

- (NSString *) runtimeDescription {
    NSMutableString *desc = [NSMutableString string];

    uint32_t propertyCount;
    objc_property_t *properties = class_copyPropertyList(self.class, &propertyCount);
    
    for (NSInteger i = 0; i < propertyCount; i++) {
        objc_property_t property = properties[i];
        NSString *propName = [NSString stringWithUTF8String:property_getName(property)];
        [desc appendFormat:@"%@: %@;\n", propName, [self valueForKey:propName]];
    }
    
    return desc.copy;
}

@end
