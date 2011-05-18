//
//  JSON2PlistAppDelegate.h
//  JSON2Plist
//
//  Created by sodas on 2011/5/18.
//  Copyright 2011 NTU Mobile & HCI Research Lab. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "JSONKit.h"

@interface JSON2PlistAppDelegate : NSObject <NSApplicationDelegate> {
@private
    NSWindow *window;
    NSTextView *jsonInputField;
    NSButton *convertButton;
    NSTextField *targetPathField;
    NSTextField *statusLabel;
}

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSTextView *jsonInputField;
@property (assign) IBOutlet NSButton *convertButton;
@property (assign) IBOutlet NSTextField *targetPathField;
@property (assign) IBOutlet NSTextField *statusLabel;

- (IBAction)convertButtonPressed:(id)sender;

@end
