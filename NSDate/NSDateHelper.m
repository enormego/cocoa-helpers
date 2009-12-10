//
//  NSDateHelper.m
//  Enormego Cocoa Helpers
//
//  Created by Shaun Harrison on 10/15/08.
//  Copyright (c) 2008-2009 enormego
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "NSDateHelper.h"

@implementation NSDate (Helper)

+ (NSDate*)dateWithString:(NSString*)dateString formatString:(NSString*)dateFormatterString {
	if(!dateString) return nil;
	
    NSDateFormatter* formatter = [[[NSDateFormatter alloc] init] autorelease];
	[formatter setDateFormat:dateFormatterString];
	return [formatter dateFromString:dateString];
}

+ (NSDate*)dateWithISO8601String:(NSString*)dateString {
	if(!dateString) return nil;
	
	if([dateString hasSuffix:@" 00:00"]) {
		dateString = [[dateString substringToIndex:(dateString.length-6)] stringByAppendingString:@"GMT"];
	} else if ([dateString hasSuffix:@"Z"]) {
		dateString = [[dateString substringToIndex:(dateString.length-1)] stringByAppendingString:@"GMT"];
	}
	
	return [[self class] dateWithString:dateString formatString:@"yyyy-MM-dd'T'HH:mm:ssZZZ"];
}

+ (NSDate*)dateWithDateString:(NSString*)dateString {
	return [[self class] dateWithString:dateString formatString:@"yyyy-MM-dd"];
}

+ (NSDate*)dateWithDateTimeString:(NSString*)dateString {
	return [[self class] dateWithString:dateString formatString:@"yyyy-MM-dd HH:mm:ss"];
}

+ (NSDate*)dateWithLongDateTimeString:(NSString*)dateString {
	return [[self class] dateWithString:dateString formatString:@"dd MMM yyyy HH:mm:ss"];
}

+ (NSDate*)dateWithRSSDateString:(NSString*)dateString {
	if ([dateString hasSuffix:@"Z"]) {
		dateString = [[dateString substringToIndex:(dateString.length-1)] stringByAppendingString:@"GMT"];
	}
	
	return [[self class] dateWithString:dateString formatString:@"EEE, d MMM yyyy HH:mm:ss ZZZ"];
}

+ (NSDate*)dateWithAltRSSDateString:(NSString*)dateString {
	if ([dateString hasSuffix:@"Z"]) {
		dateString = [[dateString substringToIndex:(dateString.length-1)] stringByAppendingString:@"GMT"];
	}
	
	return [[self class] dateWithString:dateString formatString:@"d MMM yyyy HH:mm:ss ZZZ"];
}

- (NSString*)formattedExactRelativeDate {
	NSTimeInterval time = [self timeIntervalSince1970];
	NSTimeInterval now = [[NSDate date] timeIntervalSince1970];
	NSTimeInterval diff = now - time;
	
	if(diff < 10) {
		return LocalizedString(@"just now");	
	} else if(diff < 60) {
		return LocalizedStringWithFormat(@"%d seconds ago", (int)diff);
	}
	
	diff = round(diff/60);
	if(diff < 60) {
		if(diff == 1) {
			return LocalizedStringWithFormat(@"%d minute ago", (int)diff);
		} else {
			return LocalizedStringWithFormat(@"%d minutes ago", (int)diff);
		}
	}
	
	diff = round(diff/60);
	if(diff < 24) {
		if(diff == 1) {
			return LocalizedStringWithFormat(@"%d hour ago", (int)diff);
		} else {
			return LocalizedStringWithFormat(@"%d hours ago", (int)diff);
		}
	}
	
	if(diff < 7) {
		if(diff == 1) {
			return LocalizedString(@"yesterday");
		} else {
			return LocalizedStringWithFormat(@"%d days ago", (int)diff);
		}
	}
	
	return [self formattedDateWithFormatString:LocalizedString(@"MM/dd/yy")];
}	

- (NSString*)formattedDateWithFormatString:(NSString*)dateFormatterString {
	if(!dateFormatterString) return nil;
	
    NSDateFormatter* formatter = [[[NSDateFormatter alloc] init] autorelease];
	[formatter setDateFormat:dateFormatterString];
	[formatter setAMSymbol:@"am"];
	[formatter setPMSymbol:@"pm"];
	return [formatter stringFromDate:self];
}

- (NSString*)formattedDate {
	return [self formattedDateWithFormatString:@"EEE, d MMM 'at' h:mma"];
}

- (NSString*)relativeFormattedDate {
    // Initialize the formatter.
    NSDateFormatter* formatter = [[[NSDateFormatter alloc] init] autorelease];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    [formatter setTimeStyle:NSDateFormatterNoStyle];
	
    // Initialize the calendar and flags.
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit | NSWeekdayCalendarUnit;
    NSCalendar* calendar = [NSCalendar currentCalendar];
	
    // Create reference date for supplied date.
    NSDateComponents *comps = [calendar components:unitFlags fromDate:self];
    [comps setHour:0];
    [comps setMinute:0];
    [comps setSecond:0];
	
    NSDate* suppliedDate = [calendar dateFromComponents:comps];
	
    // Iterate through the eight days (tomorrow, today, and the last six).
    int i;
    for (i = -1; i < 7; i++) {
        // Initialize reference date.
        comps = [calendar components:unitFlags fromDate:[NSDate date]];
        [comps setHour:0];
        [comps setMinute:0];
        [comps setSecond:0];
        [comps setDay:[comps day] - i];
        NSDate* referenceDate = [calendar dateFromComponents:comps];
        // Get week day (starts at 1).
        int weekday = [[calendar components:unitFlags fromDate:referenceDate] weekday] - 1;
		
        if ([suppliedDate compare:referenceDate] == NSOrderedSame && i == 0) {
            // Today
			[formatter setDateStyle:NSDateFormatterNoStyle];
			[formatter setTimeStyle:NSDateFormatterShortStyle];
			break;
        } else if ([suppliedDate compare:referenceDate] == NSOrderedSame && i == 1) {
            // Yesterday
            [formatter setDateStyle:NSDateFormatterNoStyle];
            return [NSString stringWithString:LocalizedString(@"Yesterday")];
        } else if ([suppliedDate compare:referenceDate] == NSOrderedSame) {
            // Day of the week
            return [[formatter weekdaySymbols] objectAtIndex:weekday];
        }
    }
	
    // It's not in those eight days.
    return [formatter stringFromDate:self];	
}

- (NSString*)relativeFormattedDateOnly {
    // Initialize the formatter.
    NSDateFormatter* formatter = [[[NSDateFormatter alloc] init] autorelease];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    [formatter setTimeStyle:NSDateFormatterNoStyle];
	
    // Initialize the calendar and flags.
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit | NSWeekdayCalendarUnit;
    NSCalendar* calendar = [NSCalendar currentCalendar];
	
    // Create reference date for supplied date.
    NSDateComponents *comps = [calendar components:unitFlags fromDate:self];
    [comps setHour:0];
    [comps setMinute:0];
    [comps setSecond:0];
	
    NSDate* suppliedDate = [calendar dateFromComponents:comps];
	
    // Iterate through the eight days (tomorrow, today, and the last six).
    int i;
    for (i = -1; i < 7; i++) {
        // Initialize reference date.
        comps = [calendar components:unitFlags fromDate:[NSDate date]];
        [comps setHour:0];
        [comps setMinute:0];
        [comps setSecond:0];
        [comps setDay:[comps day] - i];
        NSDate* referenceDate = [calendar dateFromComponents:comps];
        // Get week day (starts at 1).
        int weekday = [[calendar components:unitFlags fromDate:referenceDate] weekday] - 1;
		
        if ([suppliedDate compare:referenceDate] == NSOrderedSame && i == 0) {
            // Today
            [formatter setDateStyle:NSDateFormatterNoStyle];
            return [NSString stringWithString:LocalizedString(@"Today")];
        } else if ([suppliedDate compare:referenceDate] == NSOrderedSame && i == 1) {
            // Yesterday
            [formatter setDateStyle:NSDateFormatterNoStyle];
            return [NSString stringWithString:LocalizedString(@"Yesterday")];
        } else if ([suppliedDate compare:referenceDate] == NSOrderedSame && i == -1) {
            // Yesterday
            [formatter setDateStyle:NSDateFormatterNoStyle];
            return [NSString stringWithString:LocalizedString(@"Tomorrow")];
        } else if ([suppliedDate compare:referenceDate] == NSOrderedSame) {
            // Day of the week
            return [[formatter weekdaySymbols] objectAtIndex:weekday];
        }
    }
	
    // It's not in those eight days.
    return [formatter stringFromDate:self];	
}

- (NSString*)relativeFormattedDateTime {
    // Initialize the formatter.
    NSDateFormatter* formatter = [[[NSDateFormatter alloc] init] autorelease];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
	[formatter setAMSymbol:@"am"];
	[formatter setPMSymbol:@"pm"];
	
    // Initialize the calendar and flags.
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit | NSWeekdayCalendarUnit;
    NSCalendar* calendar = [NSCalendar currentCalendar];
	
    // Create reference date for supplied date.
    NSDateComponents *comps = [calendar components:unitFlags fromDate:self];
    [comps setHour:0];
    [comps setMinute:0];
    [comps setSecond:0];
	
    NSDate* suppliedDate = [calendar dateFromComponents:comps];
	
    // Iterate through the eight days (tomorrow, today, and the last six).
    int i;
    for (i = -1; i < 7; i++) {
        // Initialize reference date.
        comps = [calendar components:unitFlags fromDate:[NSDate date]];
        [comps setHour:0];
        [comps setMinute:0];
        [comps setSecond:0];
        [comps setDay:[comps day] - i];
        NSDate* referenceDate = [calendar dateFromComponents:comps];
        // Get week day (starts at 1).
        int weekday = [[calendar components:unitFlags fromDate:referenceDate] weekday] - 1;
		
        if ([suppliedDate compare:referenceDate] == NSOrderedSame && i == 0) {
            // Today
            [formatter setDateStyle:NSDateFormatterNoStyle];
  			return [NSString stringWithFormat:@"Today, %@", [formatter stringFromDate:self]];
		} else if ([suppliedDate compare:referenceDate] == NSOrderedSame && i == 1) {
            // Yesterday
            [formatter setDateStyle:NSDateFormatterNoStyle];
			return [NSString stringWithFormat:@"Yesterday, %@", [formatter stringFromDate:self]];
        } else if ([suppliedDate compare:referenceDate] == NSOrderedSame) {
            // Day of the week
            NSString* day = [[formatter weekdaySymbols] objectAtIndex:weekday];
			[formatter setDateStyle:NSDateFormatterNoStyle];
			return [NSString stringWithFormat:@"%@, %@", day, [formatter stringFromDate:self]];
        }
    }
	
    // It's not in those eight days.
    [formatter setDateStyle:NSDateFormatterShortStyle];
    [formatter setTimeStyle:NSDateFormatterNoStyle];
	NSString* date = [formatter stringFromDate:self];
	
    [formatter setDateStyle:NSDateFormatterNoStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
	NSString* time = [formatter stringFromDate:self];
	
	return [NSString stringWithFormat:@"%@, %@", date, time];
}

- (NSString*)relativeLongFormattedDate {
    // Initialize the formatter.
    NSDateFormatter* formatter = [[[NSDateFormatter alloc] init] autorelease];
    [formatter setDateStyle:NSDateFormatterFullStyle];
    [formatter setTimeStyle:NSDateFormatterNoStyle];
	
    // Initialize the calendar and flags.
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit | NSWeekdayCalendarUnit;
    NSCalendar* calendar = [NSCalendar currentCalendar];
	
    // Create reference date for supplied date.
    NSDateComponents *comps = [calendar components:unitFlags fromDate:self];
    [comps setHour:0];
    [comps setMinute:0];
    [comps setSecond:0];
	
    NSDate* suppliedDate = [calendar dateFromComponents:comps];
	
    // Iterate through the eight days (tomorrow, today, and the last six).
    int i;
    for (i = -1; i < 7; i++) {
        // Initialize reference date.
        comps = [calendar components:unitFlags fromDate:[NSDate date]];
        [comps setHour:0];
        [comps setMinute:0];
        [comps setSecond:0];
        [comps setDay:[comps day] - i];
        NSDate* referenceDate = [calendar dateFromComponents:comps];
        // Get week day (starts at 1).
        int weekday = [[calendar components:unitFlags fromDate:referenceDate] weekday] - 1;
		
        if ([suppliedDate compare:referenceDate] == NSOrderedSame && i == 0) {
            // Today
            [formatter setDateStyle:NSDateFormatterNoStyle];
            return [NSString stringWithString:LocalizedString(@"Today")];
        } else if ([suppliedDate compare:referenceDate] == NSOrderedSame && i == 1) {
            // Yesterday
            [formatter setDateStyle:NSDateFormatterNoStyle];
            return [NSString stringWithString:LocalizedString(@"Yesterday")];
        } else if ([suppliedDate compare:referenceDate] == NSOrderedSame && i == -1) {
            // Tomorrow
            [formatter setDateStyle:NSDateFormatterNoStyle];
            return [NSString stringWithString:LocalizedString(@"Tomorrow")];
        } else if ([suppliedDate compare:referenceDate] == NSOrderedSame) {
            // Day of the week
            return [[formatter weekdaySymbols] objectAtIndex:weekday];
        }
    }
	
    // It's not in those eight days.
    return [formatter stringFromDate:self];	
}

- (NSString*)formattedTime {
    // Initialize the formatter.
    NSDateFormatter* formatter = [[[NSDateFormatter alloc] init] autorelease];
    [formatter setDateStyle:NSDateFormatterNoStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
	
    return [formatter stringFromDate:self];	
}

- (NSString*)iso8601Formatted {
	return [self formattedDateWithFormatString:@"yyyy-MM-dd'T'HH:mm:ssZ"];
}

- (BOOL)isPastDate {
	NSDate* now = [NSDate date];
	if([[now earlierDate:self] isEqualToDate:self]) {
		return YES;
	} else {
		return NO;
	}	
}

- (BOOL)isDateToday {
	return [[[NSDate date] midnightDate] isEqual:[self midnightDate]];
}

- (BOOL)isDateYesterday {
	return [[[NSDate dateWithTimeIntervalSinceNow:-86400] midnightDate] isEqual:[self midnightDate]];
}

- (NSDate*)midnightDate {
	return [[NSCalendar currentCalendar] dateFromComponents:[[NSCalendar currentCalendar] components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit) fromDate:self]];
}

@end
