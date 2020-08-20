//
//  YPEventHandler.m
//  EasyEventHandler
//
//  Created by zhao on 2020/8/20.
//  Copyright © 2020 zhaoyg. All rights reserved.
//

#import "YPEventHandler.h"

static NSMapTable<NSString *, id<YPEventHandleExecutor>> *table;

@interface YPEventHandler()

@end

@implementation YPEventHandler

+ (id<YPEventHandleExecutor>)of:(NSString *)executorName {
    if (table == nil || executorName == nil) return nil;
    return [table objectForKey:executorName];
}

+ (BOOL)registerExecutor:(id<YPEventHandleExecutor>)executor byName:(NSString *)executorName {
    if (executor == nil || executorName == nil) return NO;
    
    if (table == nil) {
        table = [NSMapTable strongToWeakObjectsMapTable];
    } else {
        if ([table objectForKey:executorName]) return NO;
    }
    
    [table setObject:executor forKey:executorName];
    return YES;
}


@end
