//
//  UIApplicationHelper.h
//  Enormego Cocoa Helpers
//
//  Created by Shaun Harrison on 8/25/09.
//  Copyright 2009 enormego. All rights reserved.
//

#if TARGET_OS_IPHONE
#import <UIKit/UIKit.h>


@interface UIApplication (Helper)

/*
 * Sets the status bar style as well as the key window background color
 * UIStatusBarStyleDefault will result in a white background color
 * UIStatusBarStyleBlackTranslucent/Opaque will result in a black background color
 */
- (void)setApplicationStyle:(UIStatusBarStyle)style animated:(BOOL)animated;

@end
#endif