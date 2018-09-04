//
//  testViewController.m
//  ZX_all
//
//  Created by 赵祥 on 2018/8/21.
//  Copyright © 2018年 赵祥. All rights reserved.
//

#import "testViewController.h"
#import <mach/mach.h>
#import <mach/task_info.h>

@interface testViewController ()

@property(nonatomic)NSString *str;

@end

@implementation testViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(postMsg) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:btn];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)postMsg {
    unsigned long t = [self memoryUsage];
    NSLog(@"memoryUsage : %lu",t);
    
    UIButton *b1 = [[UIButton alloc]init];
    
    unsigned long t1 = [self memoryUsage];
    NSLog(@"memoryUsage : %lu",t1);
}


- (unsigned long)memoryUsage
{
    struct task_basic_info info;
    mach_msg_type_number_t size = sizeof(info);
    kern_return_t kr = task_info(mach_task_self(), TASK_BASIC_INFO, (task_info_t)&info, &size);
    if (kr != KERN_SUCCESS) {
        return -1;
    }
    unsigned long memorySize = info.resident_size >> 10;//10-KB   20-MB
    
    return memorySize;
}

@end
