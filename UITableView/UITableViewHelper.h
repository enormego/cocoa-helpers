//
//  UITableViewHelper.h
//  Enormego Cocoa Helpers
//
//  Created by Shaun Harrison on 2/24/09.
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
#import <UIKit/UIKit.h>


@interface UITableView (Helper)

// If active, adds an activity view to bottom of a UITableView set to "Update…"
- (void)setActivity:(BOOL)hasActivity;

// If active, adds an activity view to bottom of a UITableView with desired title
- (void)setActivity:(BOOL)hasActivity title:(NSString*)title;

// If content is unavailable, overlays the UITableView with a message indicating there's no content
// Default message is "Content Unavailable".  Will check for delegate method: tableViewContentUnavailableText:
- (void)setContentUnavailable:(BOOL)isUnavailable;

// Allows you to set everything before y=0.0f to a different color than the tableView's backgroundColor
@property(nonatomic,retain) UIColor* headerBackgroundColor;
@end

@protocol UITableViewContentUnavailableDataSource<NSObject>
// Default: "Content Unavailable"
- (NSString*)tableViewContentUnavailableText:(UITableView*)tableView;

// Default: Dark Blue
- (UIColor*)tableViewContentUnavailableTextColor:(UITableView*)tableView;

// Default: Black, 0.5 Alpha
- (UIColor*)tableViewContentUnavailableTextShadowColor:(UITableView*)tableView;

// Default: White
- (UIColor*)tableViewContentUnavailableBackgroundColor:(UITableView*)tableView;
@end

#endif