//
//  EnvironmentHelper.h
//  Enormego Helpers
//
//  Created by Shaun Harrison on 10/9/09.
//  Copyright 2009 enormego. All rights reserved.
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
+ (BOOL)isSnowLeopard;
#endif

@end
