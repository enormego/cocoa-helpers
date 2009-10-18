//
//  UIApplicationHelper.h
//  Enormego Cocoa Helpers
//
//  Created by Shaun Harrison on 8/25/09.
//  Copyright 2009 enormego. All rights reserved.
//
// This work is licensed under the Creative Commons GNU General Public License License.
// To view a copy of this license, visit http://creativecommons.org/licenses/GPL/2.0/
// or send a letter to Creative Commons, 171 Second Street, Suite 300, San Francisco, California, 94105, USA.
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