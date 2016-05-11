//
//  ViewController.m
//  NightMode
//
//  Created by liushuai on 16/5/10.
//  Copyright © 2016年 liushuai1992@gmail.com. All rights reserved.
//

#import "ViewController.h"
#import "LSNightMode.h"

@interface ViewController ()

@property (nonatomic, strong) UISwitch *swithButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //为swith按钮添加点击事件
    [self.swithButton addTarget:self action:@selector(swithButtonHandle:) forControlEvents:UIControlEventValueChanged];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UISwitch *)swithButton {
    if (!_swithButton) {
        _swithButton = [[UISwitch alloc] initWithFrame:CGRectMake(100, 100, 0, 0)];
        [self.view addSubview:_swithButton];
    }
    //根据当前夜间模式状态将swith按钮设置成为对于状态
    [_swithButton setOn:[[LSNightMode sharedNightMode] getNightModeState]];
    return _swithButton;
}

//点击swith按钮时调用
- (void)swithButtonHandle:(UISwitch *)switchButton {
    //改变当前夜间模式状态
    [[LSNightMode sharedNightMode] changeNightMode];
}

@end
