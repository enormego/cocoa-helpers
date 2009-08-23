//
//  UITableViewControllerHelper.h
//  Enormego Cocoa Helpers
//
//  Created by Shaun Harrison on 2/16/09.
//  Copyright 2009 enormego. All rights reserved.
//

#import <Foundation/Foundation.h>


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
