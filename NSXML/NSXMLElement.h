//
//  NSXMLElement.h
//  Enormego Helpers
//
//  Created by Shaun Harrison on 10/10/09.
//  Copyright 2009 enormego. All rights reserved.
//

#import <Foundation/Foundation.h>

#if MAC_OS_X_VERSION_10_4 <= MAC_OS_X_VERSION_MAX_ALLOWED
@interface NSXMLElement (Helper)

- (NSXMLElement*)elementForName:(NSString*)name;

@end
#endif