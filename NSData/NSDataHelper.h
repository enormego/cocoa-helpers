//
//  NSDataHelper.h
//  Enormego Helpers
//
//  Created by Shaun Harrison on 4/9/09.
//  Copyright 2009 enormego. All rights reserved.
//
//	This work is licensed under the Creative Commons GNU General Public License License.
//	To view a copy of this license, visit http://creativecommons.org/licenses/GPL/2.0/
//	or send a letter to Creative Commons, 171 Second Street, Suite 300, San Francisco, California, 94105, USA.
//


#import <Foundation/Foundation.h>

@interface NSData (Helper)

@property(nonatomic,readonly,getter=isEmpty) BOOL empty;

@end

/*
	Base64 Methods

	Created by Matt Gallagher on 2009/06/03.
	Copyright 2009 Matt Gallagher. All rights reserved.

	Permission is given to use this source code file, free of charge, in any
	project, commercial or otherwise, entirely at your risk, with the condition
	appreciated but not required.

 */

@interface NSData (Base64Helper)

+ (NSData *)dataFromBase64EncodedString:(NSString *)aString;
- (NSString *)base64EncodedString;

@end