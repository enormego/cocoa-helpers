//
//  NSObjectHelper.m
//  Enormego Cocoa Helpers
//
//  Created by Shaun Harrison on 5/7/09.
//  Copyright 2009 enormego. All rights reserved.
//

#import "NSObjectHelper.h"
#import </usr/include/objc/objc-class.h>

// MethodSwizzle used from here: http://www.cocoadev.com/index.pl?MethodSwizzle
BOOL MethodSwizzle(Class klass, SEL origSel, SEL altSel, BOOL forInstance) {
	
    // Make sure the class isn't nil
	if (klass == nil)
		return NO;
	
	// Look for the methods in the implementation of the immediate class
	Class iterKlass = (forInstance ? klass : klass->isa);
	Method origMethod = NULL, altMethod = NULL;
	NSUInteger methodCount = 0;
	Method *mlist = class_copyMethodList(iterKlass, &methodCount);
	if(mlist != NULL) {
		int i;
		for (i = 0; i < methodCount; ++i) {
			if(method_getName(mlist[i]) == origSel )
				origMethod = mlist[i];
			if (method_getName(mlist[i]) == altSel)
				altMethod = mlist[i];
		}
	}
	
	// if origMethod was not found, that means it is not in the immediate class
	// try searching the entire class hierarchy with class_getInstanceMethod
	// if not found or not added, bail out
	if(origMethod == NULL) {
		origMethod = class_getInstanceMethod(iterKlass, origSel);
		if(origMethod == NULL) {
			return NO;
		}
		
		if(class_addMethod(iterKlass, method_getName(origMethod), method_getImplementation(origMethod), method_getTypeEncoding(origMethod)) == NO) {
			return NO;
		}
	}
	
	// same thing with altMethod
	if(altMethod == NULL) {
		altMethod = class_getInstanceMethod(iterKlass, altSel);
		if(altMethod == NULL ) 
			return NO;
		if(class_addMethod(iterKlass, method_getName(altMethod), method_getImplementation(altMethod), method_getTypeEncoding(altMethod)) == NO )
			return NO;
	}
	
	//clean up
	free(mlist);
	
	// we now have to look up again for the methods in case they were not in the class implementation,
	//but in one of the superclasses. In the latter, that means we added the method to the class,
	//but the Leopard APIs is only 'class_addMethod', in which case we need to have the pointer
	//to the Method objects actually stored in the Class structure (in the Tiger implementation, 
	//a new mlist was explicitely created with the added methods and directly added to the class; 
	//thus we were able to add a new Method AND get the pointer to it)
	
	// for simplicity, just use the same code as in the first step
	origMethod = NULL;
	altMethod = NULL;
	methodCount = 0;
	mlist = class_copyMethodList(iterKlass, &methodCount);
	if(mlist != NULL) {
		int i;
		for (i = 0; i < methodCount; ++i) {
			if(method_getName(mlist[i]) == origSel )
				origMethod = mlist[i];
			if (method_getName(mlist[i]) == altSel)
				altMethod = mlist[i];
		}
	}
	
	// bail if one of the methods doesn't exist anywhere
	// with all we did, this should not happen, though
	if (origMethod == NULL || altMethod == NULL)
		return NO;
	
	// now swizzle
	method_exchangeImplementations(origMethod, altMethod);
	
	//clean up
	free(mlist);
	
	return YES;
}

void appendMethod(Class aClass, Class bClass, SEL bSel) {
	if(!aClass) return;
	if(!bClass) return;
	Method bMethod = class_getInstanceMethod(bClass, bSel);
	class_addMethod(aClass, method_getName(bMethod), method_getImplementation(bMethod), method_getTypeEncoding(bMethod));
}

void replaceMethod(Class toClass, Class fromClass, SEL aSelector) {
	if(!toClass) return;
	if(!fromClass) return;
	Method aMethod = class_getInstanceMethod(fromClass, aSelector);
	class_replaceMethod(toClass, method_getName(aMethod), method_getImplementation(aMethod), method_getTypeEncoding(aMethod));
}

@implementation NSObject (Helper)

+ (void)swizzleMethod:(SEL)originalMethod withMethod:(SEL)newMethod {
	MethodSwizzle([self class], originalMethod, newMethod, YES);
}

+ (void)appendMethod:(SEL)newMethod fromClass:(Class)aClass {
	appendMethod([self class], aClass, newMethod);	
}

+ (void)replaceMethod:(SEL)aMethod fromClass:(Class)aClass {
	replaceMethod([self class], aClass, aMethod);	
}

@end
