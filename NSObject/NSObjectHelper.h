//
//  NSObjectHelper.h
//  Enormego Cocoa Helpers
//
//  Created by Shaun Harrison on 5/7/09.
//  Copyright 2009 enormego. All rights reserved.
//
// This work is licensed under the Creative Commons GNU General Public License License.
// To view a copy of this license, visit http://creativecommons.org/licenses/GPL/2.0/
// or send a letter to Creative Commons, 171 Second Street, Suite 300, San Francisco, California, 94105, USA.
//

#import <Foundation/Foundation.h>

@interface NSObject (Helper)

// Reroutes all calls to the first method, to the second method in the current class
+ (void)swizzleMethod:(SEL)originalMethod withMethod:(SEL)newMethod;

// Adds the method to this class, from the indicated class
+ (void)appendMethod:(SEL)newMethod fromClass:(Class)aClass;

// Replaces calls to this classes method, with the same method from another class
+ (void)replaceMethod:(SEL)aMethod fromClass:(Class)aClass;

@end
