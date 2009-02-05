//
//  NSDictionaryHelper.m
//  CocoaHelpers
//
//  Created by Shaun Harrison on 10/29/08.
//  Copyright 2008 enormego. All rights reserved.
//

#import "NSDictionaryHelper.h"


@implementation NSDictionary (Helper)

- (BOOL)containsObjectForKey:(id)key {
	return [[self allKeys] containsObject:key];
}

- (BOOL)isEmpty {
	return [self count] == 0 ? YES : NO;
}

@end
