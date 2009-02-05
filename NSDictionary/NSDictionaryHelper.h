//
//  NSDictionaryHelper.h
//  CocoaHelpers
//
//  Created by Shaun Harrison on 10/29/08.
//  Copyright 2008 enormego. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface NSDictionary (Helper)

/*
 * Checks to see if the dictionary contains the given key
 */
- (BOOL)containsObjectForKey:(id)key;

@end
