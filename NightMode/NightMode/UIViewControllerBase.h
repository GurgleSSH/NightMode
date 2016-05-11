//
//  UIViewControllerBase.h
//  NightMode
//
//  Created by liushuai on 16/5/10.
//  Copyright © 2016年 liushuai1992@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewControllerBase : UIViewController

/** 子类可重写以下两个方法，以实现子类特有的夜间模式配色. */
//change to night mode
- (void)setToNightMode;

//change to day mode
- (void)setToDayMode;

@end
