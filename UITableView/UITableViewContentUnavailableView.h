//
//  UITableViewContentUnavailableView.h
//  Enormego Cocoa Helpers
//
//  Created by Shaun Harrison on 2/24/09.
//  Copyright 2009 enormego. All rights reserved.
//

#import <UIKit/UIKit.h>

// Used by the UITableView helper, not intended for public use

@interface UITableViewContentUnavailableView : UIView {
@private
	UILabel* label;
}

@property(nonatomic,copy) NSString* text;
@end
