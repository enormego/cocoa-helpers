//
//  EnvironmentHelper.h
//  Enormego Helpers
//
//  Created by Shaun Harrison on 10/9/09.
//  Copyright 2009 enormego. All rights reserved.
//
// This work is licensed under the Creative Commons GNU General Public License License.
// To view a copy of this license, visit http://creativecommons.org/licenses/GPL/2.0/
// or send a letter to Creative Commons, 171 Second Street, Suite 300, San Francisco, California, 94105, USA.
//

#import <Foundation/Foundation.h>

@interface EnvironmentHelper : NSObject {

}


#if TARGET_OS_IPHONE
+ (BOOL)isOS2;
+ (BOOL)isOS3;
#else
+ (BOOL)isTiger;

+ (BOOL)isLeopard;
+ (BOOL)isAtLeastLeopard;

+ (BOOL)isSnowLeopard;
+ (BOOL)isAtLeastSnowLeopard;
#endif

@end
