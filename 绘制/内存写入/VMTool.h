//
//  VMTool.h
//  ViewMem
//
//  Created by HaoCold on 2020/8/26.
//  Copyright © 2020 HaoCold. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MemRecordModel;

NS_ASSUME_NONNULL_BEGIN

typedef void(^VMToolSearchBlock)(NSInteger count, NSArray *array);

@interface VMTool : NSObject
- (void)内存修改:(mach_vm_address_t)address value:(NSString*)value type:(int)type g_task:(mach_port_t)g_task;
@end

NS_ASSUME_NONNULL_END
