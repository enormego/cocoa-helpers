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
	if(self.view.bounds.size.height == [UIScreen mainScreen].bounds.size.height) {
		if(![viewController wantsFullScreenLayout]) {
			CGRect frame = self.view.bounds;
			frame.origin.y = [UIApplication sharedApplication].statusBarFrame.size.height;
			frame.size.height -= frame.origin.y;
			viewController.view.frame = frame;
		} else {
			viewController.view.frame = self.view.bounds;
		}
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
	
	if([self isKindOfClass:[UINavigationController class]]) {
		if([((UINavigationController*)self).topViewController.view isKindOfClass:[UIScrollView class]]) {
			((UIScrollView*)((UINavigationController*)self).topViewController.view).scrollsToTop = YES;
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