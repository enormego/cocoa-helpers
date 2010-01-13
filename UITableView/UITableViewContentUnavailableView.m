//
//  UITableViewContentUnavailableView.m
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
#import "UITableViewContentUnavailableView.h"


@implementation UITableViewContentUnavailableView
@synthesize label;

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
		self.backgroundColor = [UIColor whiteColor];
		self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

		label = [[UILabel alloc] initWithFrame:CGRectMake(15.0f, 0.0f, frame.size.width-30.0f, frame.size.height)];
		label.backgroundColor = self.backgroundColor;
		label.autoresizingMask = self.autoresizingMask;
		label.text = LocalizedString(@"Content Unavailable");
		label.textAlignment = UITextAlignmentCenter;
		label.font = [UIFont boldSystemFontOfSize:13.0f];
		label.textColor = UIColorMakeRGB(0, 91, 132);
		label.shadowColor = [UIColor colorWithWhite:0.0f alpha:0.5f];
		label.shadowOffset = CGSizeMake(0.0f, 1.0f);
		label.numberOfLines = 0;
		
		[self addSubview:label];
	}
	
    return self;
}

- (void)setText:(NSString*)text {
	label.text = text;
}

- (NSString*)text {
	return label.text;
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
}


- (void)dealloc {
	[label release];
    [super dealloc];
}


@end
#endif