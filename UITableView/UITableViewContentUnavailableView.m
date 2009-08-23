//
//  UITableViewContentUnavailableView.m
//  Enormego Cocoa Helpers
//
//  Created by Shaun Harrison on 2/24/09.
//  Copyright 2009 enormego. All rights reserved.
//

#import "UITableViewContentUnavailableView.h"


@implementation UITableViewContentUnavailableView


- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
		self.backgroundColor = [UIColor colorWithWhite:0.15 alpha:1.000];
		self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

		label = [[UILabel alloc] initWithFrame:CGRectMake(15.0f, 0.0f, frame.size.width-30.0f, frame.size.height)];
		label.backgroundColor = self.backgroundColor;
		label.autoresizingMask = self.autoresizingMask;
		label.text = LocalizedString(@"Content Unavailable");
		label.textAlignment = UITextAlignmentCenter;
		label.font = [UIFont boldSystemFontOfSize:13.0f];
		label.textColor = [UIColor whiteColor];
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
