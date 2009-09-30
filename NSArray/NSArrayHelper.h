//
//  NSArrayHelper.h
//  Enormego Cocoa Helpers
//
//  Created by Shaun Harrison on 10/28/08.
//  Copyright 2008-2009 enormego. All rights reserved.
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
