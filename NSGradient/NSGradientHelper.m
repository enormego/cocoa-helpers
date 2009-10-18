//
//  NSGradientHelper.m
//  Enormego Helpers
//
//  Created by Shaun Harrison on 10/12/09.
//  Copyright 2009 enormego. All rights reserved.
//
// This work is licensed under the Creative Commons GNU General Public License License.
// To view a copy of this license, visit http://creativecommons.org/licenses/GPL/2.0/
// or send a letter to Creative Commons, 171 Second Street, Suite 300, San Francisco, California, 94105, USA.
//

#import "NSGradientHelper.h"

#if MAC_OS_X_VERSION_10_5 <= MAC_OS_X_VERSION_MAX_ALLOWED

@implementation NSGradient (Helper)

- (CGImageRef)createImageRefForSize:(NSSize)size angle:(CGFloat)angle {
	CGContextRef bitmapCtx = CGBitmapContextCreate(NULL, size.width, size.height, 8, size.width*4, [[NSColorSpace genericRGBColorSpace] CGColorSpace], kCGBitmapByteOrder32Host|kCGImageAlphaPremultipliedFirst);
	
	[NSGraphicsContext saveGraphicsState];
	[NSGraphicsContext setCurrentContext:[NSGraphicsContext graphicsContextWithGraphicsPort:bitmapCtx flipped:NO]];
	[self drawInRect:NSMakeRect(0.0f, 0.0f, size.width, size.height) angle:angle];
	[NSGraphicsContext restoreGraphicsState];
	
	CGImageRef cgImage = CGBitmapContextCreateImage(bitmapCtx);
	CGContextRelease(bitmapCtx);
	
	return cgImage;
}

- (NSImage*)imageForSize:(NSSize)size angle:(CGFloat)angle {
	CGImageRef cgImage = [self createImageRefForSize:size angle:angle];
	
	NSBitmapImageRep* bitmapRep = [[NSBitmapImageRep alloc] initWithCGImage:cgImage];
	NSImage* image = [[NSImage alloc] init];
	[image addRepresentation:bitmapRep];
	[bitmapRep release];
	
	CGImageRelease(cgImage);
	
	return [image autorelease];
}

@end

#endif