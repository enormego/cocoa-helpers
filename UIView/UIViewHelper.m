//
//  UIViewHelper.m
//  Enormego Cocoa Helpers
//
//  Created by Shaun Harrison on 1/8/10.
//  Copyright (c) 2010 enormego
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

#import "UIViewHelper.h"

CGFloat DIW(CGFloat width) {
	return DIWW(width, 320.0f, UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation) ? [UIScreen mainScreen].bounds.size.height : [UIScreen mainScreen].bounds.size.width);
}

CGFloat DIWW(CGFloat width, CGFloat baseWidth, CGFloat actualWidth) {
	return floorf((width * actualWidth) / baseWidth);
}

@implementation UIView (EGOHelper)

- (UIView*)superviewWithClass:(Class)svClass {
	return [self superviewWithClass:svClass strict:NO];
}

- (UIView*)superviewWithClass:(Class)svClass strict:(BOOL)strict {
	UIView* view = self.superview;
	
	while(view) {
		if(strict && [view isMemberOfClass:svClass]) {
			break;
		} else if(!strict && [view isKindOfClass:svClass]) {
			break;
		} else {
			view = view.superview;
		}
	}
	
	return view;
}

- (void)setDebug:(BOOL)val{
	
	self.layer.borderColor = [UIColor colorWithRed:arc4random()%1.0f green:arc4random()%1.0f blue:arc4random()%1.0f alpha:1.0f];
	self.layer.borderWidth = 1.0f;
	
}

@end

#endif