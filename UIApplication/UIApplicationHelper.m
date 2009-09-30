//
//  UIApplicationHelper.m
//  Enormego Cocoa Helpers
//
//  Created by Shaun Harrison on 8/25/09.
//  Copyright 2009 enormego. All rights reserved.
//

#if TARGET_OS_IPHONE
#import "UIApplicationHelper.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIApplication (Helper)


- (void)setApplicationStyle:(UIStatusBarStyle)style animated:(BOOL)animated {
	[self setStatusBarStyle:style animated:animated];
	
	UIColor* newBackgroundColor = style == UIStatusBarStyleDefault ? [UIColor whiteColor] : [UIColor blackColor];
	UIColor* oldBackgroundColor = style == UIStatusBarStyleDefault ? [UIColor blackColor] : [UIColor whiteColor];
	
	if(animated) {
	    [CATransaction setValue:[NSNumber numberWithFloat:0.3] forKey:kCATransactionAnimationDuration];
		
		CABasicAnimation* fadeAnimation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
		fadeAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
		fadeAnimation.fromValue = (id)oldBackgroundColor.CGColor;
		fadeAnimation.toValue = (id)newBackgroundColor.CGColor;
		fadeAnimation.fillMode = kCAFillModeForwards;
		fadeAnimation.removedOnCompletion = NO;
		[self.keyWindow.layer addAnimation:fadeAnimation forKey:@"fadeAnimation"];
		[CATransaction commit];
	} else {
		self.keyWindow.backgroundColor = newBackgroundColor;
	}
}

@end
#endif