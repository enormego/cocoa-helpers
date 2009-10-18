//
//  UIViewControllerHelper.h
//  Enormego Cocoa Helpers
//
//  Created by Shaun Harrison on 3/18/09.
//  Copyright enormego 2009. All rights reserved.
//
// This work is licensed under the Creative Commons GNU General Public License License.
// To view a copy of this license, visit http://creativecommons.org/licenses/GPL/2.0/
// or send a letter to Creative Commons, 171 Second Street, Suite 300, San Francisco, California, 94105, USA.
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