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
    [_swithButton setOn:[[LSNightMode sharedNightMode] getNightModeState]];
    return _swithButton;
}

- (void)swithButtonHandle:(UISwitch *)switchButton {
    [[LSNightMode sharedNightMode] changeNightMode];
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
