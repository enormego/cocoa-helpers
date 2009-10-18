//
//  UIDeviceHelper.h
//  CocoaHelpers
//
//  Created by Shaun Harrison on 12/11/08.
//  Copyright 2008 enormego. All rights reserved.
//
// This work is licensed under the Creative Commons GNU General Public License License.
// To view a copy of this license, visit http://creativecommons.org/licenses/GPL/2.0/
// or send a letter to Creative Commons, 171 Second Street, Suite 300, San Francisco, California, 94105, USA.
//

#import <UIKit/UIKit.h>


@interface UIDevice (Helper)

/*
 * Available device memory in MB 
 */
@property(readonly) double availableMemory;

@end
