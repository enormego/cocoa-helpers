//
//  UITableViewHelper.h
//  Enormego Cocoa Helpers
//
//  Created by Shaun Harrison on 2/24/09.
//  Copyright 2009 enormego. All rights reserved.
//

#import <Foundation/Foundation.h>


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