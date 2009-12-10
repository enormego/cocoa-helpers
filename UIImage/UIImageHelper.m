//
//  UIImageHelper.m
//  Enormego Cocoa Helpers
//
//  Created by Shaun Harrison on 12/19/08.
//  Copyright (c) 2008-2009 enormego
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
#import "UIImageHelper.h"
#import <CoreGraphics/CoreGraphics.h>

@implementation UIImage (Helper)

+ (UIImage*)imageWithContentsOfURL:(NSURL*)url {
	NSError* error;
	NSData* data = [NSURLConnection sendSynchronousRequest:[NSURLRequest requestWithURL:url] returningResponse:NULL error:NULL];
	if(error || !data) {
		return nil;
	} else {
		return [UIImage imageWithData:data];
	}
}

+ (UIImage*)imageWithResourcesPathCompontent:(NSString*)pathCompontent {
	return [UIImage imageWithContentsOfFile:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:pathCompontent]];
}

- (UIImage*)scaleToSize:(CGSize)size {
	UIGraphicsBeginImageContext(size);
	
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextTranslateCTM(context, 0.0, size.height);
	CGContextScaleCTM(context, 1.0, -1.0);
	
	CGContextDrawImage(context, CGRectMake(0.0f, 0.0f, size.width, size.height), self.CGImage);
	
	UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
	
	UIGraphicsEndImageContext();
	
	return scaledImage;
}

- (UIImage*)scaleAndCropToSize:(CGSize)size {
	if(size.height > size.width) {
		if(self.size.height > self.size.width) {
			if((self.size.width  / self.size.height) >= (size.width / size.height)) {
				return [self scaleHeightAndCropWidthToSize:size];
			} else {
				return [self scaleWidthAndCropHeightToSize:size];
			}
		} else {
			return [self scaleHeightAndCropWidthToSize:size];
		}    
	} else {
		if(self.size.width > self.size.height) {
			if((self.size.height / self.size.width) >= (size.height / size.width)) {
				return [self scaleWidthAndCropHeightToSize:size];
			} else {
				return [self scaleHeightAndCropWidthToSize:size];
			}
		} else {
			return [self scaleWidthAndCropHeightToSize:size];
		}    
	}
}

- (UIImage*)scaleHeightAndCropWidthToSize:(CGSize)size {
	float newWidth = (self.size.width * size.height) / self.size.height;
	return [self scaleToSize:size withOffset:CGPointMake((newWidth - size.width) / 2, 0.0f)];
}

- (UIImage*)scaleWidthAndCropHeightToSize:(CGSize)size {
	float newHeight = (self.size.height * size.width) / self.size.width;
	return [self scaleToSize:size withOffset:CGPointMake(0, (newHeight - size.height) / 2)];
}

- (UIImage*)scaleToSize:(CGSize)size withOffset:(CGPoint)offset {
	UIImage* scaledImage = [self scaleToSize:CGSizeMake(size.width + (offset.x * -2), size.height + (offset.y * -2))];
	
	UIGraphicsBeginImageContext(size);
	
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextTranslateCTM(context, 0.0, size.height);
	CGContextScaleCTM(context, 1.0, -1.0);
	
	CGRect croppedRect;
	croppedRect.size = size;
	croppedRect.origin = CGPointZero;
	
	CGContextClipToRect(context, croppedRect);
	
	CGRect drawRect;
	drawRect.origin = offset;
	drawRect.size = scaledImage.size;
	
	CGContextDrawImage(context, drawRect, scaledImage.CGImage);
	
	
	UIImage* croppedImage = UIGraphicsGetImageFromCurrentImageContext();
	
	UIGraphicsEndImageContext();
	
	return croppedImage;
}

@end
#endif