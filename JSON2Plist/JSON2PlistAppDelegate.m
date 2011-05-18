//
//  JSON2PlistAppDelegate.m
//  JSON2Plist
//
//  Created by sodas on 2011/5/18.
//  Copyright 2011 NTU Mobile & HCI Research Lab. All rights reserved.
//

#import "JSON2PlistAppDelegate.h"

@implementation JSON2PlistAppDelegate

@synthesize window;
@synthesize jsonInputField;
@synthesize convertButton;
@synthesize targetPathField;
@synthesize statusLabel;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    [convertButton setTarget:self];
    [convertButton setAction:@selector(convertButtonPressed)];
}

- (IBAction)convertButtonPressed:(id)sender {
    // Clear status
    [statusLabel setTextColor:[NSColor blackColor]];
    [statusLabel setStringValue:@""];
    // Check path
    if ([targetPathField stringValue]==nil || [[targetPathField stringValue] isEqualToString:@""]) {
        [statusLabel setTextColor:[NSColor redColor]];
        [statusLabel setStringValue:@"QQ. Where do you want to save?"];
        return;
    }
    // Convert Input
    NSString *input = [jsonInputField string];
    id rawResult = [input objectFromJSONString];
    if (rawResult!=nil) {
        [rawResult writeToFile:[targetPathField stringValue] atomically:YES];
        [statusLabel setTextColor:[NSColor colorWithCalibratedRed:0.25 green:0.5 blue:0 alpha:1]];
        [statusLabel setStringValue:@"Yeah! Converted"];
    }
    else {
        [statusLabel setTextColor:[NSColor redColor]];
        [statusLabel setStringValue:@"QQ. It's not a valid JSON"];
    }
}

@end
