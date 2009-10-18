//
//  UITableViewControllerHelper.h
//  Enormego Cocoa Helpers
//
//  Created by Shaun Harrison on 2/16/09.
//  Copyright 2009 enormego. All rights reserved.
//
// This work is licensed under the Creative Commons GNU General Public License License.
// To view a copy of this license, visit http://creativecommons.org/licenses/GPL/2.0/
// or send a letter to Creative Commons, 171 Second Street, Suite 300, San Francisco, California, 94105, USA.
//

#if TARGET_OS_IPHONE
#import <UIKit/UIKit.h>

@interface UITableViewController (Helper)

// Returns height of a cell given the desired attributes, font-size is 14.0f (This should be change-able)
- (CGFloat)cellHeightWithText:(NSString*)text padding:(float)padding;
- (CGFloat)cellHeightWithText:(NSString*)text padding:(float)padding minimumHeight:(float)minimumHeight;
- (CGFloat)cellHeightWithText:(NSString*)text padding:(float)padding maximumHeight:(float)maximumHeight;
- (CGFloat)cellHeightWithText:(NSString*)text padding:(float)padding minimumHeight:(float)minimumHeight maximumHeight:(float)maximumHeight;

// Returns an NSArray of generated NSIndexPaths based on parameters
- (NSArray*)indexPathsFromRow:(NSUInteger)fromRow toRow:(NSUInteger)toRow inSection:(NSUInteger)inSection;

// Returns an NSArray containing a single NSIndexPath
- (NSArray*)indexPathsForRow:(NSUInteger)forRow inSection:(NSUInteger)inSection;
@end
#endif