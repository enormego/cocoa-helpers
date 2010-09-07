//
//  UIViewHelper.h
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
#import <UIKit/UIKit.h>

#define UIViewAutoresizingFlexibleMargins UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin
#define UIViewAutoresizingFlexibleSize UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight

// Device Independent Width
// Calculates a width based on baseWidth, and scales it up or down depending on actualWidth
CGFloat DIW(CGFloat width); // baseWidth = 320, actualWidth = device width
CGFloat DIWW(CGFloat width, CGFloat baseWidth, CGFloat actualWidth);

@interface UIView (EGOHelper)

/*
 * Steps through the current views superview hiearchy until it finds a view with the given class
 *	If strict is set to NO, it will match using isKindOfClass:
 *	If strict is set to YES, it will match using isMemberOfClass:
 */
- (UIView*)superviewWithClass:(Class)svClass; // strict:NO
- (UIView*)superviewWithClass:(Class)svClass strict:(BOOL)strict;
- (void)setDebug:(BOOL)val;
@end

#endif