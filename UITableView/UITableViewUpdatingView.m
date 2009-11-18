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
#import "NSStringHelper.h"
#import <QuartzCore/QuartzCore.h>

#define LABEL_FONT [UIFont boldSystemFontOfSize:16.0f]

@implementation UITableViewUpdatingView

- (id)initWithFrame:(CGRect)frame {
	return [self initWithFrame:frame title:[[self class] defaultTitle]];
}

- (id)initWithFrame:(CGRect)frame title:(NSString*)title {
	if (self = [super initWithFrame:frame]) {
		self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5f];
		self.layer.masksToBounds = YES;
		self.layer.cornerRadius = 9.0f;

		label = [[UILabel alloc] initWithFrame:CGRectMake(39.0f, 0.0f, frame.size.width-50.0f, frame.size.height)];
		label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
		label.backgroundColor = [UIColor clearColor];
		label.textColor = [UIColor whiteColor];
		label.font = LABEL_FONT;
		label.text = title;
		label.textAlignment = UITextAlignmentCenter;
		[self addSubview:label];
		
		activitiyIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
		activitiyIndicatorView.frame = CGRectMake(11.0f, floorf((frame.size.height-20.0f) / 2.0f), 20.0f, 20.0f);
		activitiyIndicatorView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleRightMargin;
		[self addSubview:activitiyIndicatorView];
		[activitiyIndicatorView startAnimating];	
    }
	
    return self;
}

+ (NSString*)defaultTitle {
	return LocalizedString(@"Updating…");	
}

+ (CGFloat)widthForTitle:(NSString*)title {
	if(!title) {
		title = [self defaultTitle];
	}
	
	return [title sizeWithFont:LABEL_FONT].width + 50.0f;
}

- (void)dealloc {
	[activitiyIndicatorView release];
	[label release];
    [super dealloc];
}


@end
