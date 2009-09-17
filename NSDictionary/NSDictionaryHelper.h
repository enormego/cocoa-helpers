//
//  NSDictionaryHelper.h
//  CocoaHelpers
//
//  Created by Shaun Harrison on 10/29/08.
//  Copyright 2008 enormego. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSDictionary (Helper)

/*
 * Checks to see if the dictionary contains the given key
 */
- (BOOL)containsObjectForKey:(id)key;

/*
 * Checks to see if the dictionary is empty
 */
@property(nonatomic,readonly,getter=isEmpty) BOOL empty;

@end
