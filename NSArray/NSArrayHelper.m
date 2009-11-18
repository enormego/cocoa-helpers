//
//  NSArrayHelper.m
//  Enormego Cocoa Helpers
//
//  Created by Shaun Harrison on 10/28/08.
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

#import "NSArrayHelper.h"


@implementation NSArray (Helper)

+ (NSArray*)arrayWithAlphaNumericTitles {
	return [self arrayWithAlphaNumericTitlesWithSearch:NO];
}

+ (NSArray*)arrayWithAlphaNumericTitlesWithSearch:(BOOL)search {
	if(search) {
		return [NSArray arrayWithObjects: @"{search}",
				@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", 
				@"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", 
				@"W", @"X", @"Y", @"Z", @"#", nil];
	} else {
		return [NSArray arrayWithObjects:
				@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", 
				@"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", 
				@"W", @"X", @"Y", @"Z", @"#", nil];
	}
}

- (BOOL)isEmpty {
	return [self count] == 0 ? YES : NO;
}

@end
