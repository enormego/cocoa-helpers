//
//  UITableViewControllerHelper.m
//  Enormego Cocoa Helpers
//
//  Created by Shaun Harrison on 2/16/09.
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
#endif