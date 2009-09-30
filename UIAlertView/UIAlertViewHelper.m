//
//  UIAlertViewHelper.m
//  Enormego Cocoa Helpers
//
//  Created by Shaun Harrison on 10/16/08.
//  Copyright 2008-2009 enormego. All rights reserved.
//

#if TARGET_OS_IPHONE
#import "UIAlertViewHelper.h"

void UIAlertViewQuick(NSString* title, NSString* message, NSString* dismissButtonTitle) {
	UIAlertView* alert = [[UIAlertView alloc] initWithTitle:LocalizedString(title) 
													message:LocalizedString(message) 
												   delegate:nil 
										  cancelButtonTitle:LocalizedString(dismissButtonTitle) 
										  otherButtonTitles:nil
						  ];
	[alert show];
	[alert autorelease];
}


@implementation UIAlertView (Helper)

@end
#endif