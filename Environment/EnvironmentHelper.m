//
//  EnvironmentHelper.m
//  Enormego Helpers
//
//  Created by Shaun Harrison on 10/9/09.
//  Copyright 2009 enormego. All rights reserved.
//

#import "EnvironmentHelper.h"


@implementation EnvironmentHelper

#if TARGET_OS_IPHONE

+ (BOOL)isOS2 {
	return [[UIDevice currentDevice].systemVersion hasPrefix:@"2."];
}

+ (BOOL)isOS3 {
	return [[UIDevice currentDevice].systemVersion hasPrefix:@"3."];
}

#else

+ (NSString*)systemVersion  {
	SInt32 systemVersionMajor;
	SInt32 systemVersionMinor;
	SInt32 systemVersionBugFix;
	Gestalt(gestaltSystemVersionMajor, &systemVersionMajor);
	Gestalt(gestaltSystemVersionMinor, &systemVersionMinor);
	Gestalt(gestaltSystemVersionBugFix, &systemVersionBugFix);

	return [NSString stringWithFormat:@"%u.%u.%u", systemVersionMajor, systemVersionMinor, systemVersionBugFix];
}

+ (BOOL)isTiger {
	return [[self systemVersion] hasPrefix:@"10.4."];
}

+ (BOOL)isLeopard {
	return [[self systemVersion] hasPrefix:@"10.5."];
}

+ (BOOL)isSnowLeopard {
	return [[self systemVersion] hasPrefix:@"10.6."];
}

#endif

@end
