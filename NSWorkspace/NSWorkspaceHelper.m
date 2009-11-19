//
//  NSWorkspaceHelper.m
//  Enormego Helpers
//
//  Created by Shaun Harrison on 11/18/09.
//  Copyright (c) 2009 enormego
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "NSWorkspaceHelper.h"

@implementation NSWorkspace (Helper)

- (void)registerLoginLaunchBundle:(NSBundle*)bundle {
	[self unregisterLoginLaunchBundle:bundle]; // Removes the old bundle, incase the application location changed
	
	NSURL* bundleURL = [NSURL fileURLWithPath:[bundle bundlePath] isDirectory:YES];
	if(!bundleURL) return;
	
	LSSharedFileListRef loginList = LSSharedFileListCreate(NULL, kLSSharedFileListSessionLoginItems, NULL);
	if(!loginList) return;
	
	LSSharedFileListItemRef loginItem;

	if((loginItem = LSSharedFileListInsertItemURL(loginList, kLSSharedFileListItemLast, NULL, NULL, (CFURLRef)bundleURL, NULL, NULL))) {
		CFRelease(loginItem);
	}
	
	CFRelease(loginList);
}

- (void)unregisterLoginLaunchBundle:(NSBundle*)bundle {
	NSString* bundleIdentifier = [bundle bundleIdentifier];

	LSSharedFileListRef loginList = LSSharedFileListCreate(NULL, kLSSharedFileListSessionLoginItems, NULL);
	if(!loginList) return;
	
	UInt32 seedValue;
	NSArray* loginItemsArray = (NSArray *)LSSharedFileListCopySnapshot(loginList, &seedValue);
	if(!loginItemsArray) return;
	
	for (id item in loginItemsArray) {		
		LSSharedFileListItemRef itemRef = (LSSharedFileListItemRef)item;
		CFURLRef bundleURL;
		
		if (LSSharedFileListItemResolve(itemRef, 0, &bundleURL, NULL) == noErr) {
			if([[[NSBundle bundleWithPath:(NSString*)CFURLGetString(bundleURL)] bundleIdentifier] isEqualToString:bundleIdentifier]) {
				LSSharedFileListItemRemove(loginList, itemRef);
			}
		}
	}
	
	[loginItemsArray release];
	
	CFRelease(loginList);	
}

- (void)unregisterLoginLaunchApplication:(NSString*)appName {
	LSSharedFileListRef loginList = LSSharedFileListCreate(NULL, kLSSharedFileListSessionLoginItems, NULL);
	if(!loginList) return;
	
	UInt32 seedValue;
	NSArray* loginItemsArray = (NSArray *)LSSharedFileListCopySnapshot(loginList, &seedValue);
	if(!loginItemsArray) return;
	
	for (id item in loginItemsArray) {		
		LSSharedFileListItemRef itemRef = (LSSharedFileListItemRef)item;
		NSString* itemName = (NSString*)LSSharedFileListItemCopyDisplayName(itemRef);
		
		if (itemName) {
			if([itemName isEqualToString:appName]) {
				LSSharedFileListItemRemove(loginList, itemRef);
			}
			
			[itemName release];
		}
	}
	
	[loginItemsArray release];
	
	CFRelease(loginList);	
}

@end
