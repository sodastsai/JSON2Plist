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
    [targetPathField setStringValue:[[NSUserDefaults standardUserDefaults] objectForKey:@"OutputPath"]];
}

- (IBAction)convertButtonPressed:(id)sender {
    // Clear status
    [statusLabel setTextColor:[NSColor blackColor]];
    [statusLabel setStringValue:@""];
    // Check path
    NSString *path = [targetPathField stringValue];
    if (path==nil || [path isEqualToString:@""]) {
        [statusLabel setTextColor:[NSColor redColor]];
        [statusLabel setStringValue:@"QQ. Where do you want to save?"];
        return;
    }
    if (![[NSFileManager defaultManager] isWritableFileAtPath:[path stringByDeletingLastPathComponent]]) {
        [statusLabel setTextColor:[NSColor redColor]];
        [statusLabel setStringValue:@"QQ. Cannot write here."];
        return;
    }
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"Y-m-d-H-M-S"];
        NSString *current = [formatter stringFromDate:[NSDate date]];
        [formatter release];
        
        NSString *newPath = [NSString stringWithFormat:@"%@.%@.%@",
                             [path stringByDeletingPathExtension],
                             current,
                             [path pathExtension]];
        [[NSFileManager defaultManager] moveItemAtPath:path toPath:newPath error:nil];
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
    
    // Save path for convinience
    [[NSUserDefaults standardUserDefaults] setObject:path forKey:@"OutputPath"];
}

@end
