//
//  UIViewControllerHelper.h
//  Enormego Cocoa Helpers
//
//  Created by Shaun Harrison on 3/18/09.
//  Copyright enormego 2009. All rights reserved.
//

#if TARGET_OS_IPHONE
#import <UIKit/UIKit.h>

@interface UIViewController (Helper)

// A "Pop Up" is intended to only take up a portion of the screen, similar to a UIAlertView

// Adds a "Pop Up" view to the current view controller
- (void)presentPopUpViewController:(UIViewController*)viewController;

// Dismisses the "Pop Up" view
- (void)dismissPopUpViewController; // Calls the method below on parentViewController
- (void)dismissPopUpViewController:(UIViewController*)viewController;

@end
#endif