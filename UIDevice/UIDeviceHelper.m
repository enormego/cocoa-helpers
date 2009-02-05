//
//  UIDeviceHelper.m
//  CocoaHelpers
//
//  Created by Shaun Harrison on 12/11/08.
//  Copyright 2008 enormego. All rights reserved.
//

#import "UIDeviceHelper.h"
#include <sys/sysctl.h>  
#include <mach/mach.h>

@implementation UIDevice (Helper)

- (double)availableMemory {
	vm_statistics_data_t vmStats;
	mach_msg_type_number_t infoCount = HOST_VM_INFO_COUNT;
	kern_return_t kernReturn = host_statistics(mach_host_self(), HOST_VM_INFO, (host_info_t)&vmStats, &infoCount);
	
	if(kernReturn != KERN_SUCCESS) {
		return NSNotFound;
	}
	
	return ((vm_page_size * vmStats.free_count) / 1024.0) / 1024.0;
}

@end
