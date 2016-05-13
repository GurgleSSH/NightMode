//
//  UIViewControllerBase.m
//  NightMode
//
//  Created by liushuai on 16/5/10.
//  Copyright © 2016年 liushuai1992@gmail.com. All rights reserved.
//

#import "UIViewControllerBase.h"
#import "LSNightMode.h"

@interface UIViewControllerBase () <LSNightMode>

@end

@implementation UIViewControllerBase

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[LSNightMode sharedNightMode] nightModeWithObserver:self]; //一步方法，将当前VC设为观察者，从配置文件中获取当前夜间模式状态并设置成对应模式
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)setToDayMode {
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)setToNightMode {
    self.view.backgroundColor = [UIColor grayColor];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
