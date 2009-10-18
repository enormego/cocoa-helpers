//
//  UIApplicationHelper.m
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