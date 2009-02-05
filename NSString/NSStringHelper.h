//
//  NSStringHelper.h
//  CocoaHelpers
//
//  Created by Shaun Harrison on 10/14/08.
//  Copyright 2008 enormego. All rights reserved.
//

#import <Cocoa/Cocoa.h>

/* 
 * Short hand NSLocalizedString, doesn't need 2 parameters
 */
#define LocalizedString(s) NSLocalizedString(s,s)

/*
 * LocalizedString with an additionl parameter for formatting
 */
#define LocalizedStringWithFormat(s,...) [NSString stringWithFormat:NSLocalizedString(s,s),##__VA_ARGS__]

@interface NSString (Helper)

/*
 * Checks to see if the string contains the given string, case insenstive
 */
- (BOOL)containsString:(NSString*)string;

/*
 * Checks to see if the string contains the given string while allowing you to define the compare options
 */
- (BOOL)containsString:(NSString*)string options:(NSStringCompareOptions)options;

/*
 * Returns the MD5 value of the string
 */
- (NSString*)md5;

@end
