//
//  UITableViewContentUnavailableView.h
//  Enormego Cocoa Helpers
//
//  Created by Shaun Harrison on 2/24/09.
//  Copyright 2009 enormego. All rights reserved.
//
// This work is licensed under the Creative Commons GNU General Public License License.
// To view a copy of this license, visit http://creativecommons.org/licenses/GPL/2.0/
// or send a letter to Creative Commons, 171 Second Street, Suite 300, San Francisco, California, 94105, USA.
//

#if TARGET_OS_IPHONE
#import <UIKit/UIKit.h>

// Used by the UITableView helper, not intended for public use

@interface UITableViewContentUnavailableView : UIView {
@private
	UILabel* label;
}

@property(nonatomic,copy) NSString* text;
@end
#endif