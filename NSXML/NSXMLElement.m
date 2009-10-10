//
//  NSXMLElement.m
//  Enormego Helpers
//
//  Created by Shaun Harrison on 10/10/09.
//  Copyright 2009 enormego. All rights reserved.
//

#import "NSXMLElement.h"

#if MAC_OS_X_VERSION_10_4 <= MAC_OS_X_VERSION_MAX_ALLOWED
@implementation NSXMLElement (Helper)

- (NSXMLElement*)elementForName:(NSString*)name {
	return [[self elementsForName:name] lastObject];
}

@end
#endif