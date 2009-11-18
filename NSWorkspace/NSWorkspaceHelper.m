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
	
	LSSharedFileListRef loginList = LSSharedFileListCreate(NULL, kLSSharedFileListSessionLoginItems, NULL);
	
	LSSharedFileListItemRef loginItem = LSSharedFileListInsertItemURL(loginList, kLSSharedFileListItemLast, NULL, NULL, (CFURLRef)bundleURL, NULL, NULL);             
	CFRelease(loginItem);
	
	CFRelease(loginList);
}

- (void)unregisterLoginLaunchBundle:(NSBundle*)bundle {
	LSSharedFileListRef loginList = LSSharedFileListCreate(NULL, kLSSharedFileListSessionLoginItems, NULL);
	CFArrayRef loginItems = LSSharedFileListCopySnapshot(loginList, NULL);
	
	for(id loginItem in (NSArray*)loginItems) {
		CFURLRef outURL;
		
		LSSharedFileListItemResolve((LSSharedFileListItemRef)loginItem, 0, &outURL, NULL);
		NSBundle* loginItemBundle = [NSBundle bundleWithPath:[(NSURL*)outURL path]];
		
		if([[loginItemBundle bundleIdentifier] isEqualToString:[bundle bundleIdentifier]]) {
			LSSharedFileListItemRemove(loginList, (LSSharedFileListItemRef)loginItem);
		}

		CFRelease(outURL);
	}
	
	CFRelease(loginItems);
	CFRelease(loginList);
}

- (void)unregisterLoginLaunchApplication:(NSString*)appName {
	LSSharedFileListRef loginList = LSSharedFileListCreate(NULL, kLSSharedFileListSessionLoginItems, NULL);
	CFArrayRef loginItems = LSSharedFileListCopySnapshot(loginList, NULL);
	
	for(id loginItem in (NSArray*)loginItems) {
		CFStringRef listItemName = LSSharedFileListItemCopyDisplayName((LSSharedFileListItemRef)loginItem);
		
		if([(NSString*)listItemName isEqualToString:appName]) {
			LSSharedFileListItemRemove(loginList, (LSSharedFileListItemRef)loginItem);
		}
		
		CFRelease(listItemName);
	}
	
	CFRelease(loginItems);
	CFRelease(loginList);
}

@end
