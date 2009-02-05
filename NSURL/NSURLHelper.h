//
//  NSURLHelper.h
//  CocoaHelpers
//
//  Created by Shaun Harrison on 12/19/08.
//  Copyright 2008 enormego. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSURL (Helper)

/*
 * Returns a string of the base of the URL, will contain a trailing slash
 *
 * Example:
 * NSURL is http://www.cnn.com/full/path?query=string&key=value
 * baseString will return: http://www.cnn.com/
 */
- (NSString*)baseString;

@end
