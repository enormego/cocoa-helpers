//
//  UITableViewControllerHelper.m
//  Enormego Cocoa Helpers
//
//  Created by Shaun Harrison on 2/16/09.
//  Copyright 2009 enormego. All rights reserved.
//

#import "UITableViewControllerHelper.h"


@implementation UITableViewController (Helper)

- (CGFloat)cellHeightWithText:(NSString*)text padding:(float)padding {
	return [self cellHeightWithText:text padding:padding minimumHeight:0.0f maximumHeight:0.0f];
}

- (CGFloat)cellHeightWithText:(NSString*)text padding:(float)padding minimumHeight:(float)minimumHeight {
	return [self cellHeightWithText:text padding:padding minimumHeight:minimumHeight maximumHeight:0.0f];
}

- (CGFloat)cellHeightWithText:(NSString*)text padding:(float)padding maximumHeight:(float)maximumHeight {
	return [self cellHeightWithText:text padding:padding minimumHeight:0.0f maximumHeight:maximumHeight];
}

- (CGFloat)cellHeightWithText:(NSString*)text padding:(float)padding minimumHeight:(float)minimumHeight maximumHeight:(float)maximumHeight {
	CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:14.0f] constrainedToSize:CGSizeMake(300.0f, 99999999.0f) lineBreakMode:UILineBreakModeWordWrap];
	float height = size.height + padding;
	if(minimumHeight > 0.0f && height < minimumHeight) {
		height = minimumHeight;
	}
	
	if(maximumHeight > 0.0f && height > maximumHeight) {
		height = maximumHeight;
	}
	
	return height;
}

- (NSArray*)indexPathsFromRow:(NSUInteger)fromRow toRow:(NSUInteger)toRow inSection:(NSUInteger)inSection {
	NSMutableArray* indexPaths = [NSMutableArray arrayWithCapacity:toRow-fromRow];
	int x;
	for(x=fromRow;x<=toRow;x++) {
		[indexPaths addObject:[NSIndexPath indexPathForRow:x inSection:inSection]];
	}
	
	return indexPaths;
}

- (NSArray*)indexPathsForRow:(NSUInteger)forRow inSection:(NSUInteger)inSection {
	return [NSArray arrayWithObject:[NSIndexPath indexPathForRow:forRow inSection:inSection]];
}

@end
