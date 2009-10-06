//
//  UIViewControllerHelper.m
//  Enormego Cocoa Helpers
//
//  Created by Shaun Harrison on 3/18/09.
//  Copyright enormego 2009. All rights reserved.
//

#if TARGET_OS_IPHONE
#import "UIViewControllerHelper.h"

@interface UIViewController (Private)
- (void)setParentViewController:(UIViewController*)parentViewController;
@end

@implementation UIViewController (Helper)

- (void)presentPopUpViewController:(UIViewController*)viewController {
	[viewController setParentViewController:self];

	if(![[UIApplication sharedApplication] isStatusBarHidden]) {
		CGRect frame = self.view.bounds;
		frame.origin.y = [UIApplication sharedApplication].statusBarFrame.size.height;
		frame.size.height -= frame.origin.y;
		viewController.view.frame = frame;
	} else {
		viewController.view.frame = self.view.bounds;
	}
	
	viewController.view.alpha = 0.0f;

	[self.view addSubview:viewController.view];
	
	[viewController viewWillAppear:YES];
	
	[UIView beginAnimations:@"presentPopUpViewController" context:viewController];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(presentedPopUpViewController:finished:viewController:)];
	viewController.view.alpha = 1.0f;
	[UIView commitAnimations];
	
	[viewController retain];
}

- (void)presentedPopUpViewController:(id)name finished:(id)finished viewController:(UIViewController*)viewController {
	[viewController viewDidAppear:YES];
}

- (void)dismissPopUpViewController {
	[self.parentViewController dismissPopUpViewController:self];
}

- (void)dismissPopUpViewController:(UIViewController*)viewController {
	[viewController viewWillDisappear:YES];
	
	[UIView beginAnimations:@"dismissPopUpViewController" context:viewController];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(dismissedPopUpViewController:finished:viewController:)];
	viewController.view.alpha = 0.0f;
	[UIView commitAnimations];
	
	UINavigationController* navigationController = nil;
	
	if([self isKindOfClass:[UINavigationController class]]) {
		navigationController = (id)self;
	} else if([self isKindOfClass:[UITabBarController class]]) {
		if([[(UITabBarController*)self selectedViewController] isKindOfClass:[UINavigationController class]]) {
			navigationController = (id)[(UITabBarController*)self selectedViewController];
		}
	}
	
	if(navigationController) {
		if([navigationController.topViewController.view isKindOfClass:[UIScrollView class]]) {
			((UIScrollView*)navigationController.topViewController.view).scrollsToTop = YES;
		}
	}
}

- (void)dismissedPopUpViewController:(id)name finished:(id)finished viewController:(UIViewController*)viewController {
	[viewController.view removeFromSuperview];
	[viewController viewDidDisappear:YES];
	[viewController release];
}

@end
#endif