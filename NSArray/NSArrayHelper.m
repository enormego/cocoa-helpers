//
//  NSArrayHelper.m
//  Enormego Cocoa Helpers
//
//  Created by Shaun Harrison on 10/28/08.
//  Copyright 2008-2009 enormego. All rights reserved.
//
// This work is licensed under the Creative Commons GNU General Public License License.
// To view a copy of this license, visit http://creativecommons.org/licenses/GPL/2.0/
// or send a letter to Creative Commons, 171 Second Street, Suite 300, San Francisco, California, 94105, USA.
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
