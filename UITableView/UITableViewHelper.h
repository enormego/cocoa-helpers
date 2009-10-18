//
//  UITableViewHelper.h
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


@interface UITableView (Helper)

// If active, adds an activity view to bottom of a UITableView set to "Update..."
- (void)setActivity:(BOOL)isAnimated;

// If active, adds an activity view to bottom of a UITableView with desired title
- (void)setActivity:(BOOL)isAnimated title:(NSString*)title;

// If content is unavailable, overlays the UITableView with a message indicating there's no content
// Default message is "Content Unavailable".  Will check for delegate method: tableViewContentUnavailableText:
- (void)setContentUnavailable:(BOOL)isUnavailable;

@end

@protocol UITableViewContentUnavailableDataSource<NSObject>
- (NSString*)tableViewContentUnavailableText:(UITableView*)tableView;
@end
#endif