//
//  UIViewControllerHelper.m
//  Enormego Cocoa Helpers
//
//  Created by Shaun Harrison on 3/18/09.
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

#if TARGET_OS_IPHONE
#import "UIViewControllerHelper.h"

@implementation UIViewController (Helper)

- (void)presentPopUpViewController:(UIViewController<PopUpViewControllerDelegate>*)viewController {
	viewController.poppedUpFromViewController = self;
	BOOL isLandscape = UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation]);
	
	if((self.view.bounds.size.height == [UIScreen mainScreen].bounds.size.height && !isLandscape) || (self.view.bounds.size.height == [UIScreen mainScreen].bounds.size.width && isLandscape)) {
		if(![viewController wantsFullScreenLayout]) {
			
			CGRect frame = self.view.bounds;
			if(isLandscape) {
				frame.origin.y = [UIApplication sharedApplication].statusBarFrame.size.width;
			} else {
				frame.origin.y = [UIApplication sharedApplication].statusBarFrame.size.height;
			}
			
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
	[((UIViewController<PopUpViewControllerDelegate>*)self).poppedUpFromViewController dismissPopUpViewController:self];
}

- (void)dismissPopUpViewController:(UIViewController<PopUpViewControllerDelegate>*)viewController {
	[viewController viewWillDisappear:YES];
	
	[UIView beginAnimations:@"dismissPopUpViewController" context:viewController];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(dismissedPopUpViewController:finished:viewController:)];
	viewController.view.alpha = 0.0f;
	[UIView commitAnimations];
	
	if([self isKindOfClass:[UINavigationController class]]) {
		if([((UINavigationController*)self).topViewController.view isKindOfClass:[UIScrollView class]]) {
			((UIScrollView*)((UINavigationController*)self).topViewController.view).scrollsToTop = YES;
		} else if([((UINavigationController*)self).topViewController respondsToSelector:@selector(tableView)]) {
			((UITableViewController*)((UINavigationController*)self).topViewController).tableView.scrollsToTop = YES;
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