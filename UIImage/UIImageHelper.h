//
//  UIImageHelper.h
//  CocoaHelpers
//
//  Created by Shaun Harrison on 12/19/08.
//  Copyright 2008 enormego. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIImage (Helper)

/*
 * Creates an image from the contents of a URL
 */
+ (UIImage*)imageWithContentsOfURL:(NSURL*)url;

/*
 * Scales the image to the given size
 */
- (UIImage*)scaleToSize:(CGSize)size;

/*
 * Scales and crops the image to the given size
 * Automatically detects the size/height and offset
 * Sides of the image will be cropped so the result is centered
 */
- (UIImage*)scaleAndCropToSize:(CGSize)size;

/*
 * Scales the height and crops the width to the size
 * Sides of the image will be cropped so the result is centered
 */
- (UIImage*)scaleHeightAndCropWidthToSize:(CGSize)size;

/*
 * Scales the width and crops the height to the size
 * Sides of the image will be cropped so the result is centered
 */
- (UIImage*)scaleWidthAndCropHeightToSize:(CGSize)size;

/*
 * Scales image to the size, crops to the offset
 * Provide offset based on scaled size, not original size
 *
 * Example:
 * Image is 640x480, scaling to 480x320
 * This will then scale to 480x360
 *
 * If you want to vertically center the image, set the offset to CGPointMake(0.0,-20.0f)
 * Now it will clip the top 20px, and the bottom 20px giving you the desired 480x320
 */
- (UIImage*)scaleToSize:(CGSize)size withOffset:(CGPoint)offset;	

@end
