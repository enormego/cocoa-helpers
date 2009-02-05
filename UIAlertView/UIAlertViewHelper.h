//
//  UIAlertViewHelper.h
//  CocoaHelpers
//
//  Created by Shaun Harrison on 10/16/08.
//  Copyright 2008 enormego. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 * Convenience method to throw a quick alert to the user
 * Runs LocalizedString() on all strings
 */
void UIAlertViewQuick(NSString* title, NSString* message, NSString* dismissButtonTitle);

@interface UIAlertView (Helper)

@end
