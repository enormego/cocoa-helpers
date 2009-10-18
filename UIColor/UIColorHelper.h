//
//  UIColorHelper.h
//  Enormego Cocoa Helpers
//
//  Created by Shaun Harrison on 11/20/08.
//  Copyright 2008-2009 enormego. All rights reserved.
//
// This work is licensed under the Creative Commons GNU General Public License License.
// To view a copy of this license, visit http://creativecommons.org/licenses/GPL/2.0/
// or send a letter to Creative Commons, 171 Second Street, Suite 300, San Francisco, California, 94105, USA.
//

#if TARGET_OS_IPHONE
#import <UIKit/UIKit.h>

/*
 * Convenience method to return a UIColor with RGB values based on 255
 */
#define UIColorMakeRGB(nRed,nGreen,nBlue) [UIColor colorWithRed:(nRed)/255.0f green:(nGreen)/255.0f blue:(nBlue)/255.0f alpha:1.0f]

@interface UIColor (Helper)

@end
#endif