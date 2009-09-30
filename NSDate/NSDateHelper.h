//
//  NSDateHelper.h
//  Enormego Cocoa Helpers
//
//  Created by Shaun Harrison on 10/15/08.
//  Copyright 2008-2009 enormego. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSDate (Helper)

// Returns an NSDate based on a string with formatting options passed to NSDateFormatter
+ (NSDate*)dateWithString:(NSString*)dateString formatString:(NSString*)dateFormatterString;

// Returns an NSDate with an ISO8610 format, aka ATOM: yyyy-MM-dd'T'HH:mm:ssZZZ 
+ (NSDate*)dateWithISO8601String:(NSString*)str;

// Returns an NSDate with a 'yyyy-MM-dd' string
+ (NSDate*)dateWithDateString:(NSString*)str;

// Returns an NSDate with a 'yyyy-MM-dd HH:mm:ss' string
+ (NSDate*)dateWithDateTimeString:(NSString*)str;

// Returns an NSDate with a 'dd MMM yyyy HH:mm:ss' string
+ (NSDate*)dateWithLongDateTimeString:(NSString*)str;

// Returns an NSDate with an RSS formatted string: 'EEE, d MMM yyyy HH:mm:ss ZZZ' string
+ (NSDate*)dateWithRSSDateString:(NSString*)str;

// Returns an NSDate with an alternative RSS formatted string: 'd MMM yyyy HH:mm:ss ZZZ' string
+ (NSDate*)dateWithAltRSSDateString:(NSString*)str;

// just now, 2 minutes ago, 2 hours ago, 2 days ago, etc.
- (NSString*)formattedExactRelativeDate;

// Pass in an string compatible with NSDateFormatter
- (NSString*)formattedDateWithFormatString:(NSString*)dateFormatterString;

// Returns date formatted to: EEE, d MMM 'at' h:mma
- (NSString*)formattedDate;

// Returns date formatted to: NSDateFormatterShortStyle
- (NSString*)formattedTime;

// Returns date formatted to: Weekday if within last 7 days, Yesterday/Tomorrow, or NSDateFormatterShortStyle for everything else
- (NSString*)relativeFormattedDate;

// Returns date formatted to: Weekday if within last 7 days, Yesterday/Today/Tomorrow, or NSDateFormatterShortStyle for everything else
// If date is today, returns no Date, instead returns NSDateFormatterShortStyle for time
- (NSString*)relativeFormattedDateOnly;

// Returns date formatted to: Weekday if within last 7 days, Yesterday/Today/Tomorrow, or NSDateFormatterFullStyle for everything else
// Also returns NSDateFormatterShortStyle for time
- (NSString*)relativeFormattedDateTime;

// Returns date formatted to: Weekday if within last 7 days, Yesterday/Today/Tomorrow, or NSDateFormatterFullStyle for everything else
- (NSString*)relativeLongFormattedDate;

// Returns date formatted for ISO8601/ATOM: yyyy-MM-dd'T'HH:mm:ssZZZ
- (NSString*)iso8601Formatted;

// Checks whether current date is past date
- (BOOL)isPastDate;

// Returns the current date, at midnight
- (NSDate*)midnightDate;

@end
