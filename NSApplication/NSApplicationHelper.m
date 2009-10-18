//
//  NSApplicationHelper.m
//  Enormego Helpers
//
//  Created by Shaun Harrison on 4/9/09.
//  Copyright 2009 enormego. All rights reserved.
//
// This work is licensed under the Creative Commons GNU General Public License License.
// To view a copy of this license, visit http://creativecommons.org/licenses/GPL/2.0/
// or send a letter to Creative Commons, 171 Second Street, Suite 300, San Francisco, California, 94105, USA.
//

#import "NSApplicationHelper.h"

#if MAC_OS_X_VERSION_10_5 <= MAC_OS_X_VERSION_MAX_ALLOWED

NSString* AppSupportDirectory() {
	NSString* appSupportDir = [NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES) objectAtIndex:0];
	appSupportDir = [appSupportDir stringByAppendingPathComponent:[[NSProcessInfo processInfo] processName]];
	
	if(![[NSFileManager defaultManager] fileExistsAtPath:appSupportDir]) {
		[[NSFileManager defaultManager] createDirectoryAtPath:appSupportDir withIntermediateDirectories:YES attributes:nil error:NULL];
	}
	
	return appSupportDir;
}

@implementation NSApplication (Helper)

@end

#endif