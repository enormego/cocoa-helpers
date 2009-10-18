//
//  NSArrayHelper.h
//  Enormego Cocoa Helpers
//
//  Created by Shaun Harrison on 10/28/08.
//  Copyright 2008-2009 enormego. All rights reserved.
//
// This work is licensed under the Creative Commons GNU General Public License License.
// To view a copy of this license, visit http://creativecommons.org/licenses/GPL/2.0/
// or send a letter to Creative Commons, 171 Second Street, Suite 300, San Francisco, California, 94105, USA.
//

#import <Foundation/Foundation.h>


@interface NSArray (Helper)

/*
 * Returns an array with A-Z and # to be used as section titles
 */
+ (NSArray*)arrayWithAlphaNumericTitles;

/*
 * Returns an array with the Search icon, A-Z and # to be used as section titles
 */
+ (NSArray*)arrayWithAlphaNumericTitlesWithSearch:(BOOL)search;

/*
 * Checks to see if the array is empty
 */
@property(nonatomic,readonly,getter=isEmpty) BOOL empty;

@end
