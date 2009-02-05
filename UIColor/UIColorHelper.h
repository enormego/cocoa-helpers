//
//  UIColorHelper.h
//  CocoaHelpers
//
//  Created by Shaun Harrison on 11/20/08.
//  Copyright 2008 enormego. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 * Convenience method to return a UIColor with RGB values based on 255
 */
#define UIColorMakeRGB(nRed,nGreen,nBlue) [UIColor colorWithRed:(nRed)/255.0f green:(nGreen)/255.0f blue:(nBlue)/255.0f alpha:1.0f]

@interface UIColor (Helper)

@end
