//
//  ExceptionHelper.m
//  Enormego Helpers
//
//  Created by Shaun Harrison on 3/13/09.
//  Copyright 2009 enormego. All rights reserved.
//

#import "ExceptionHelper.h"

#ifdef ENABLE_EXCEPTIONS

@implementation ExceptionHelper
+ (void)generateStackTraceForException:(NSException*)exception {
	NSString* processIdentifier = [[NSNumber numberWithInt:[[NSProcessInfo processInfo] processIdentifier]] stringValue];
	NSString* stackAddresses = [[exception callStackReturnAddresses] componentsJoinedByString:@" "];
	NSMutableString* debugInfo = [NSMutableString string];
	[debugInfo appendString:@"\n"];
	[debugInfo appendString:@"================================\n"];
	[debugInfo appendString:@"Exception Caught:\n"];
	[debugInfo appendString:@"--------------------------------\n"];
	[debugInfo appendFormat:@"Name: %@\n", exception.name];
	[debugInfo appendFormat:@"Reason: %@\n", exception.reason];
	if(exception.userInfo) {
		[debugInfo appendFormat:@"Additional Info: %@\n", exception.userInfo];
	} else {
		[debugInfo appendString:@"No additional information available..\n"];
	}
	[debugInfo appendString:@"--------------------------------\n"];
	[debugInfo appendFormat:@"Run the following command in GDB to view a full stack trace:\n\nshell atos -p %@ %@\n\n", processIdentifier, stackAddresses];
	[debugInfo appendString:@"================================\n"];
	NSLog(@"%@", debugInfo);

	while(1) {
		// Keeps the process alive while you run the command.
	}
}
@end

#endif
