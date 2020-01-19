//
//  SBAppDelegate.m
//  DisplayPretty
//
//  Created by Stig Brautaset on 21/04/2014.
//  Copyright (c) 2014 Stig Brautaset. All rights reserved.
//

#import <SBJson5.h>
#import "SBAppDelegate.h"

@interface SBAppDelegate () < NSTextViewDelegate >

@property (strong) SBJson5Writer *writer;
@property (assign) IBOutlet NSTextView *input;
@property (assign) IBOutlet NSTextView *output;

@end

@implementation SBAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    self.writer = [SBJson5Writer writerWithMaxDepth:32
                                      humanReadable:YES
                                           sortKeys:YES];
}

- (void)textDidChange:(NSNotification *)notification
{
    id block = ^(id obj, BOOL *ignored) {
        id data = [self.writer dataWithObject:obj];
        self.output.string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    };
    
    id eh = ^(NSError *err) {
        self.output.string = err.description;
    };

    id parser = [SBJson5Parser parserWithBlock:block
                                allowMultiRoot:NO
                               unwrapRootArray:NO
                                      maxDepth:32
                                  errorHandler:eh];
    [parser parse:[self.input.string dataUsingEncoding:NSUTF8StringEncoding]];
}

@end
