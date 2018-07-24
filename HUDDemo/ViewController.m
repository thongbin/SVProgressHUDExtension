//
//  ViewController.m
//  HUDDemo
//
//  Created by Kelvin on 2018/7/23.
//  Copyright © 2018年 Kelvin. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+KTHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundColor:[UIColor redColor]];
    [button setFrame:CGRectMake(0, 200, 375, 50)];
    [button setCenter:CGPointMake(self.view.frame.size.width/2, 200)];
    [button setTitle:@"show me" forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:20]];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}

-(void)buttonAction:(UIButton *)button
{
    [self hud_showSuccessMsg:@"我是展示信息" completion:^{
        [self hud_toastStatus:@"展示完了我才出现"];
    }];
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//       [self hud_showSuccessMsg:@"我是展示信息2"];
//    });
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
