//
//  UITableViewHelper.m
//  Enormego Cocoa Helpers
//
//  Created by Shaun Harrison on 2/24/09.
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
#import "UITableViewHelper.h"
#import "UITableViewContentUnavailableView.h"
#import "UITableViewUpdatingView.h"

#define UPDATING_OFFSET_Y (self.frame.size.height - 42.0f - 10.0f)
#define BACKGROUND_HEADER_TAG 0x8577
#define ACTIVITY_TAG 0x5646

@interface UITableView (HelperPrivate)
- (UIView*)overlayView;
- (UITableViewUpdatingView*)updatingView;
@end


@implementation UITableView (Helper)

- (UIColor*)headerBackgroundColor {
	return [self viewWithTag:BACKGROUND_HEADER_TAG].backgroundColor;
}

- (void)setHeaderBackgroundColor:(UIColor*)color {
	UIView* headerBackgroundView;
	
	if(!(headerBackgroundView = [self viewWithTag:BACKGROUND_HEADER_TAG])) {
		headerBackgroundView = [[[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0 - self.bounds.size.height, self.bounds.size.width, self.bounds.size.height)] autorelease];
        headerBackgroundView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
		headerBackgroundView.tag = BACKGROUND_HEADER_TAG;
		[self insertSubview:headerBackgroundView atIndex:0];
	}
	
	headerBackgroundView.backgroundColor = color;
}

- (void)setActivity:(BOOL)hasActivity {
	[self setActivity:hasActivity title:[UITableViewUpdatingView defaultTitle]];
}

- (void)setActivity:(BOOL)hasActivity title:(NSString*)title {
	[[self updatingView] removeFromSuperview];
	
	if(hasActivity) {
		CGRect updatingRect;
		updatingRect.size = CGSizeMake([UITableViewUpdatingView widthForTitle:title], 42.0f);
		updatingRect.origin.y = UPDATING_OFFSET_Y;
		updatingRect.origin.x = roundf((self.frame.size.width - updatingRect.size.width) / 2);
		
		UITableViewUpdatingView* updatingView = [[UITableViewUpdatingView alloc] initWithFrame:updatingRect title:title];
		updatingView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin;
		updatingView.tag = ACTIVITY_TAG;
		[self addSubview:updatingView];
		[updatingView release];
	}
}

- (void)setContentUnavailable:(BOOL)isUnavailable {
	self.scrollEnabled = !isUnavailable;
	[[self overlayView] removeFromSuperview];
	
	if(isUnavailable) {
		CGRect frame = CGRectMake(0.0f, 0.0f, self.frame.size.width, self.frame.size.height);
		if(self.tableHeaderView) {
			frame.origin.y = self.tableHeaderView.frame.size.height;
			frame.size.height -= frame.origin.y;
		}
		
		frame.size.height -= self.contentInset.top;
		frame.size.height -= self.contentInset.bottom;
		
		frame.size.width -= self.contentInset.left;
		frame.size.width -= self.contentInset.left;
		
		UITableViewContentUnavailableView* view = [[UITableViewContentUnavailableView alloc] initWithFrame:frame];
		if([self.dataSource respondsToSelector:@selector(tableViewContentUnavailableText:)]) {
			view.text = [(id<UITableViewContentUnavailableDataSource>)self.dataSource tableViewContentUnavailableText:self];
		}
		
		[self addSubview:view];
		[view release];
	}
}

- (void)didAddSubview:(UIView *)subview {
	[super didAddSubview:subview];
	UIView* overlayView = [self overlayView];
	if(overlayView) {
		[self bringSubviewToFront:overlayView];
	}
	
	UIView* updatingView = [self updatingView];
	if(updatingView) {
		[self bringSubviewToFront:updatingView];
	}
}

- (UIView*)overlayView {
	for(UIView* view in self.subviews) {
		if([view isKindOfClass:[UITableViewContentUnavailableView class]]) {
			return view;
		}
	}
	
	return nil;
}

- (UITableViewUpdatingView*)updatingView {
	return (UITableViewUpdatingView*)[self viewWithTag:ACTIVITY_TAG];
}

- (void)setContentOffset:(CGPoint)point {
	[super setContentOffset:point];
	UIView* updatingView = [self updatingView];
	if(updatingView) {
		updatingView.frame = CGRectMake(updatingView.frame.origin.x, UPDATING_OFFSET_Y + point.y, updatingView.frame.size.width, updatingView.frame.size.height);
	}
}

@end
#endif