//
//  UITableViewUpdatingView.m
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

#import "UITableViewUpdatingView.h"


@implementation UITableViewUpdatingView


- (id)initWithFrame:(CGRect)frame {
	return [self initWithFrame:frame title:LocalizedString(@"Updating...")];
}

- (id)initWithFrame:(CGRect)frame title:(NSString*)title {
	if (self = [super initWithFrame:frame]) {
		self.backgroundColor = [UIColor clearColor];
		
		label = [[UILabel alloc] initWithFrame:CGRectZero];
		label.backgroundColor = [UIColor clearColor];
		label.textColor = [UIColor whiteColor];
		label.font = [UIFont boldSystemFontOfSize:16.0f];
		label.text = title;
		
		float textWidth = [label.text sizeWithFont:label.font].width;
		float width = self.frame.size.width;
		float height = self.frame.size.height;
		float offsetX = (int)((width-textWidth-20-8) / 2);
		float offsetY = (int)((height-20) / 2);
		
		label.frame = CGRectMake(offsetX+20.0f+8.0f, offsetY, textWidth, 20.0f);
		
		[self addSubview:label];
		
		activitiyIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
		activitiyIndicatorView.frame = CGRectMake(offsetX, offsetY, 20.0f, 20.0f);
		[self addSubview:activitiyIndicatorView];
		[activitiyIndicatorView startAnimating];	
    }
	
    return self;
}

- (void)drawRect:(CGRect)rect {
	UIBezierPath* bezierPath = [UIBezierPath roundedRectBezierPath:rect withRoundedCorners:kUIBezierPathAllCorners withCornerRadius:9.0f];
	[[UIColor colorWithWhite:0.0f alpha:0.5f] set];
	[bezierPath fill];
}


- (void)dealloc {
	[activitiyIndicatorView release];
	[label release];
    [super dealloc];
}


@end
