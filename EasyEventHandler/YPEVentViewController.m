//
//  YPEVentViewController.m
//  EasyEventHandler
//
//  Created by zhao on 2020/8/20.
//  Copyright © 2020 zhaoyg. All rights reserved.
//

#import "YPEVentViewController.h"
#import "YPEventHandler.h"


@interface YPEVentViewController ()<YPEventHandleExecutor>

@end

@implementation YPEVentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // action
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    [view addGestureRecognizer:tap];
    
    // register
    BOOL res = [YPEventHandler registerExecutor:self byName:NSStringFromClass([YPEVentViewController class])];
    
    
}

- (void)tapAction {
    id<YPEventHandleExecutor> executor = [YPEventHandler of:NSStringFromClass([YPEVentViewController class])];
    [executor perfromEventName:@"aaaa" params:nil];
}



- (BOOL)canPerformEventByName:(NSString *)eventName {
    return YES;
}

- (void)perfromEventName:(NSString *)eventName params:(id)params {
    NSLog(@"event: %@",eventName);
}


@end
