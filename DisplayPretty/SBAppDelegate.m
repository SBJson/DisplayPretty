//
//  SBAppDelegate.m
//  DisplayPretty
//
//  Created by Stig Brautaset on 21/04/2014.
//  Copyright (c) 2014 Stig Brautaset. All rights reserved.
//

#import <SBJson4.h>
#import "SBAppDelegate.h"

@interface SBAppDelegate () < NSTextViewDelegate >

@property (strong) SBJson4Writer *writer;
@property (assign) IBOutlet NSTextView *input;
@property (assign) IBOutlet NSTextView *output;

@end

@implementation SBAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    self.writer = [[SBJson4Writer alloc] init];
    self.writer.humanReadable = YES;
    self.writer.sortKeys = YES;
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

    id parser = [SBJson4Parser parserWithBlock:block allowMultiRoot:NO unwrapRootArray:NO errorHandler:eh];
    [parser parse:[self.input.string dataUsingEncoding:NSUTF8StringEncoding]];
}

@end
