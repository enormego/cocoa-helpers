//
//  NSDictionaryHelper.h
//  Enormego Cocoa Helpers
//
//  Created by Shaun Harrison on 10/29/08.
//  Copyright 2008-2009 enormego. All rights reserved.
//
// This work is licensed under the Creative Commons GNU General Public License License.
// To view a copy of this license, visit http://creativecommons.org/licenses/GPL/2.0/
// or send a letter to Creative Commons, 171 Second Street, Suite 300, San Francisco, California, 94105, USA.
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
