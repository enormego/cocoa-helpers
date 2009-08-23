//
//  UITableViewHelper.m
//  Enormego Cocoa Helpers
//
//  Created by Shaun Harrison on 2/24/09.
//  Copyright 2009 enormego. All rights reserved.
//

#import "UITableViewHelper.h"
#import "UITableViewContentUnavailableView.h"
#import "UITableViewUpdatingView.h"

#define UPDATING_OFFSET_Y (self.frame.size.height - 42.0f - 10.0f)

@interface UITableView (HelperPrivate)
- (UIView*)overlayView;
- (UITableViewUpdatingView*)updatingView;
@end


@implementation UITableView (Helper)

- (void)setActivity:(BOOL)isAnimated {
	[self setActivity:isAnimated title:LocalizedString(@"Updating...")];
}

- (void)setActivity:(BOOL)isAnimated title:(NSString*)title {
	[[self updatingView] removeFromSuperview];
	
	if(isAnimated) {
		UITableViewUpdatingView* view = [[UITableViewUpdatingView alloc] initWithFrame:CGRectMake((int)((self.frame.size.width-130.0f)/2), UPDATING_OFFSET_Y, 130.0f, 42.0f) title:title];
		view.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin;
		[self addSubview:view];
		[view release];
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
	for(UIView* view in self.subviews) {
		if([view isKindOfClass:[UITableViewUpdatingView class]]) {
			return (UITableViewUpdatingView*)view;
		}
	}
	
	return nil;
}

- (void)setContentOffset:(CGPoint)point {
	[super setContentOffset:point];
	UIView* updatingView = [self updatingView];
	if(updatingView) {
		updatingView.frame = CGRectMake(updatingView.frame.origin.x, UPDATING_OFFSET_Y + point.y, updatingView.frame.size.width, updatingView.frame.size.height);
	}
}

@end
