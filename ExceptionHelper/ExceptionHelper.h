//
//  ExceptionHelper.h
//  Enormego Helpers
//
//  Created by Shaun Harrison on 3/13/09.
//  Copyright 2009 enormego. All rights reserved.
//
// This work is licensed under the Creative Commons GNU General Public License License.
// To view a copy of this license, visit http://creativecommons.org/licenses/GPL/2.0/
// or send a letter to Creative Commons, 171 Second Street, Suite 300, San Francisco, California, 94105, USA.
//

#if TARGET_IPHONE_SIMULATOR
// #define ENABLE_EXCEPTIONS 1
#endif

#ifdef ENABLE_EXCEPTIONS
#import <Foundation/Foundation.h>

@interface ExceptionHelper : NSObject {

}

// This will output a command to console to run in atos to get a full stacktrace
// It will also display any available information with the exception
+ (void)generateStackTraceForException:(NSException*)exception;

@end
#endif