/*
 * Author: sodas http://about.me/sodastsai
 * Copyright 2011 NTU Mobile & HCI Research Lab
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 * http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * 
 */
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
