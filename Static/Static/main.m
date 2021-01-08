//
//  main.m
//  Static
//
//  Created by evilpenguin
//

#import <Foundation/Foundation.h>
#import "Static.h"

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        Static *staticTool = [[Static alloc] initWithArgs:argv count:argc];
        
        if (staticTool.isReady) [staticTool start];
        else [staticTool printHelp];
    }
    
    return 0;
}
