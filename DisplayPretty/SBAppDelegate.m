//
//  SBAppDelegate.m
//  DisplayPretty
//
//  Created by Stig Brautaset on 21/04/2014.
//  Copyright (c) 2014 Stig Brautaset. All rights reserved.
//

#import "SBAppDelegate.h"

@interface SBAppDelegate () < NSTextViewDelegate >

@property (assign) IBOutlet NSTextView *input;
@property (assign) IBOutlet NSTextView *output;

@end

@implementation SBAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (void)textDidChange:(NSNotification *)notification
{
    self.output.string = self.input.string;
}

@end
