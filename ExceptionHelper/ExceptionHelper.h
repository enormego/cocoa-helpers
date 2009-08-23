//
//  ExceptionHelper.h
//  Enormego Helpers
//
//  Created by Shaun Harrison on 3/13/09.
//  Copyright 2009 enormego. All rights reserved.
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