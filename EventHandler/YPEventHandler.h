//
//  YPEventHandler.h
//  EasyEventHandler
//
//  Created by zhao on 2020/8/20.
//  Copyright © 2020 zhaoyg. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol YPEventHandleExecutor

- (BOOL)canPerformEventByName:(NSString *)eventName;

- (void)perfromEventName:(NSString *)eventName params:(id)params;

@end




@interface YPEventHandler : NSObject

+ (BOOL)registerExecutor:(id<YPEventHandleExecutor>)executor byName:(NSString *)executorName;

+ (id<YPEventHandleExecutor>)of:(NSString *)executorName;

@end
