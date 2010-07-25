//
//  NSURLHelper.m
//  CocoaHelpers
//
//  Created by Shaun Harrison on 12/19/08.
//  Copyright (c) 2008-2009 enormego
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
		
		[baseString appendString:[self host]];
		
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
			baseString = [baseString stringByReplacingOccurrencesOfString:[self path] withString:@""];
		}
		
		if(self.query) {
			baseString = [baseString stringByReplacingOccurrencesOfString:[self query] withString:@""];
		}
		
		baseString = [baseString stringByReplacingOccurrencesOfString:@"?" withString:@""];
		
		if(![baseString hasSuffix:@"/"]) {
			baseString = [baseString stringByAppendingString:@"/"];
		}
		
		return baseString;
	}
}

@end
