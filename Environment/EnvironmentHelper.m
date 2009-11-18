//
//  EnvironmentHelper.m
//  Enormego Helpers
//
//  Created by Shaun Harrison on 10/9/09.
//  Copyright (c) 2009 enormego
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

+ (void)systemVersionMajor:(SInt32*)systemVersionMajor minor:(SInt32*)systemVersionMinor bugFix:(SInt32*)systemVersionBugFix {
	Gestalt(gestaltSystemVersionMajor, &*systemVersionMajor);
	Gestalt(gestaltSystemVersionMinor, &*systemVersionMinor);
	Gestalt(gestaltSystemVersionBugFix, &*systemVersionBugFix);
}

+ (NSString*)systemVersion  {
	SInt32 systemVersionMajor;
	SInt32 systemVersionMinor;
	SInt32 systemVersionBugFix;
	
	[self systemVersionMajor:&systemVersionMajor minor:&systemVersionMinor bugFix:&systemVersionBugFix];
	
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

+ (BOOL)isAtLeastLeopard {
	SInt32 systemVersionMajor;
	SInt32 systemVersionMinor;
	SInt32 systemVersionBugFix;
	
	[self systemVersionMajor:&systemVersionMajor minor:&systemVersionMinor bugFix:&systemVersionBugFix];
	
	return systemVersionMajor >= 10 && systemVersionMinor >= 5;
}

+ (BOOL)isAtLeastSnowLeopard {
	SInt32 systemVersionMajor;
	SInt32 systemVersionMinor;
	SInt32 systemVersionBugFix;
	
	[self systemVersionMajor:&systemVersionMajor minor:&systemVersionMinor bugFix:&systemVersionBugFix];
	
	return systemVersionMajor >= 10 && systemVersionMinor >= 6;
}

#endif

@end
