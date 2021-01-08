//
//  Static.m
//  Static
//
//  Created by evilpenguin
//

#import "Static.h"
#import "ArgumentsParser.h"
#import "PackageCreator.h"
#import "FileExplorer.h"
#import "ExternalTools.h"
#import "ArtifactContainer.h"
#import "RuleEngine.h"
#import "FileConverter.h"
#import "Outputter.h"

@interface Static ()
@property (nonatomic, strong) Arguments *arguments;
@property (nonatomic, strong) Package *package;

@end

@implementation Static

#pragma mark - Static

- (instancetype) initWithArgs:(const char **)array count:(int)count {
    if (self = [super init]) {
        self.arguments = [ArgumentsParser parseArgumentsFromArray:array withCount:count];
    }
    
    return self;
}

#pragma mark - Public

- (BOOL) isReady {
    BOOL ready = YES;
    ready &= self.arguments.isValid;
    
    // Check for tools
    if (!ExternalTools.hasTools) {
        ready &= NO;
    }
    
    return ready;
}

- (void) printHelp {
    [self.arguments printHelp];
    
    if (!ExternalTools.hasTools) {
        [ExternalTools printRequiredTools];
    }
}

- (void) start {
    // Package
    self.package = [PackageCreator createPackageFromArguments:self.arguments];
    [self.package unzip];
    
    // Container
    ArtifactContainer *container = [[ArtifactContainer alloc] init];
    
    // Rules
    RuleEngine *engine = [[RuleEngine alloc] init];
    
    // Explore
    [FileExplorer explorePackage:self.package block:^(NSString *path) {
        NSData *data = [NSData dataWithContentsOfFile:path];
        
        // Convert file
        BOOL converted = [FileConverter convertFileAtPath:path withData:data];
        if (converted) data = [NSData dataWithContentsOfFile:path];
        
        // Check file
        ArtifactFile *artifact = [engine checkForArtifactOnPath:path withData:data];
        if (artifact) [container addArtifact:artifact];
    }];
    
    // Output
    [Outputter outputArtifacts:container package:self.package toPath:self.arguments.outputPath ];
}

@end
