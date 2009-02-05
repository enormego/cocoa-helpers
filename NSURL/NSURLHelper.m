//
//  NSURLHelper.m
//  CocoaHelpers
//
//  Created by Shaun Harrison on 12/19/08.
//  Copyright 2008 enormego. All rights reserved.
//

#import "NSURLHelper.h"


@implementation NSURL (Helper)

- (NSString*)baseString {
	// Let's see if we can build it, it'll be the most accurate
	if([self scheme] && [self host]) {
		NSMutableString* baseString = [[NSMutableString alloc] initWithString:@""];
		
		[baseString appendFormat:@"%@://", [self scheme]];
		
		if([self user]) {
			if([self password]) {
				[baseString appendFormat:@"%@:%@@", [self user], [self password]];
			} else {
				[baseString appendFormat:@"%@@", [self user]];
			}
		}
		
		[baseString appendFormat:[self host]];
		
		if([self port]) {
			[baseString appendFormat:@":%@", [[self port] integerValue]];
		}
		
		[baseString appendString:@"/"];
		
		return [baseString autorelease];
	}
	
	// Oh Well, time to strip it down
	else {
		NSString* baseString = [self absoluteString];
		
		if(![[self path] isEqualToString:@"/"]) {
			baseString = [baseString replaceString:[self path] withString:@""];
		}
		
		if(self.query) {
			baseString = [baseString replaceString:[self query] withString:@""];
		}
		
		baseString = [baseString replaceString:@"?" withString:@""];
		
		if(![baseString hasSuffix:@"/"]) {
			baseString = [baseString stringByAppendingString:@"/"];
		}
		
		return baseString;
	}
}

@end
