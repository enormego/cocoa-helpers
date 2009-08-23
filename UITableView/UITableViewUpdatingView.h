//
//  UITableViewUpdatingView.h
//  Enormego Cocoa Helpers
//
//  Created by Shaun Harrison on 2/24/09.
//  Copyright 2009 enormego. All rights reserved.
//

#import <UIKit/UIKit.h>

// Used by the UITableView helper, not intended for public use

@interface UITableViewUpdatingView : UIView {
@private
	UIActivityIndicatorView* activitiyIndicatorView;
	UILabel* label;
}

- (id)initWithFrame:(CGRect)frame title:(NSString*)title;

@end
