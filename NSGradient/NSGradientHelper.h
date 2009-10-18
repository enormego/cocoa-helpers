//
//  NSGradientHelper.h
//  Enormego Helpers
//
//  Created by Shaun Harrison on 10/12/09.
//  Copyright 2009 enormego. All rights reserved.
//
// This work is licensed under the Creative Commons GNU General Public License License.
// To view a copy of this license, visit http://creativecommons.org/licenses/GPL/2.0/
// or send a letter to Creative Commons, 171 Second Street, Suite 300, San Francisco, California, 94105, USA.
//

#import <Foundation/Foundation.h>

#if MAC_OS_X_VERSION_10_5 <= MAC_OS_X_VERSION_MAX_ALLOWED

@interface NSGradient (Helper)

- (CGImageRef)createImageRefForSize:(NSSize)size angle:(CGFloat)angle;
- (NSImage*)imageForSize:(NSSize)size angle:(CGFloat)angle;

@end

#endif