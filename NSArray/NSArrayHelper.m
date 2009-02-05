//
//  NSArrayHelper.m
//  CocoaHelpers
//
//  Created by Shaun Harrison on 10/28/08.
//  Copyright 2008 enormego. All rights reserved.
//

#import "NSArrayHelper.h"


@implementation NSArray (Helper)

- (BOOL)isEmpty {
	return [self count] == 0 ? YES : NO;
}

@end
