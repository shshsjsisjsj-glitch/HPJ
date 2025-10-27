//
//  VMTool.m
//  ViewMem
//
//  Created by HaoCold on 2020/8/26.
//  Copyright © 2020 HaoCold. All rights reserved.
//

#import "VMTool.h"
#include "mem.h"
#import <dlfcn.h>
#import <mach-o/dyld.h>

@interface VMTool()

@property (nonatomic,  assign) int  pid;
@end

@implementation VMTool

// 修改数值
- (void)内存修改:(mach_vm_address_t)address value:(NSString*)value type:(int)type g_task:(mach_port_t)g_task
{
    const char *value2 = [value UTF8String];
    int size = 0;
    void *v = value_of_type(value2, type, &size);
    int ret = write_mem(g_task, address, v, size);
    if (ret == 1) {
        NSLog(@"memlog: 修改成功");
    }
    else {
        NSLog(@"memlog: 修改失败: %d", ret);
    }
}

@end

