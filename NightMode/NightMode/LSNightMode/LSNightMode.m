//
//  LSNightMode.m
//
//  Created by liushuai on 16/3/30.
//  Copyright © 2016年 liushuai1992@gmail.com. All rights reserved.
//

#import "LSNightMode.h"

NSString * const LSDayModeNotification = @"LSDayModeNotification";
NSString * const LSNightModeNotification = @"LSNightModeNotification";
NSString * const LSIsNight = @"NightMode";

@interface LSNightMode ()

@property (nonatomic, assign) BOOL isNight;
@property (nonatomic, strong) NSUserDefaults *userDefaults;

@end

@implementation LSNightMode

#pragma mark - dealloc
- (void)dealloc
{
}

#pragma mark - singleton pattern
+ (instancetype)sharedNightMode {
    static LSNightMode *nightMode = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        nightMode = [[LSNightMode alloc] init];
    });
    return nightMode;
}

#pragma mark - night mode

#pragma mark ** one step method
- (void)nightModeWithObserver:(id)observer {
    //1.add observers in notificationCenter
    [self notificationForNightModelWithObserver:observer];
    //2.get and set the present mode state
    [self getNightModeState];
}

#pragma mark ** methods

/**
 *  @author liushuai1992@gmail.com, 2016-03
 *
 *  @brief add Observers to Notification for night mode
 *  为夜间模式的通知添加观察者
 *  添加观察者来观察夜间模式状态改变时系统发出的通知，并根据发出的通知（夜间、日间）来做页面上的改变，一般由ViewController来实现NightMode的协议方法。
 *
 *  @param observer 观察者
 */
- (void)notificationForNightModelWithObserver:(id)observer {
    //day mode
    if ([observer respondsToSelector:@selector(setToDayMode)]) {
        [[NSNotificationCenter defaultCenter] addObserver:observer selector:@selector(setToDayMode) name:LSDayModeNotification object:nil];
    }
    
    //night mode
    if ([observer respondsToSelector:@selector(setToNightMode)]) {
        [[NSNotificationCenter defaultCenter] addObserver:observer selector:@selector(setToNightMode) name:LSNightModeNotification object:nil];
    }
}


/**
 *  @author liushuai1992@gmail.com, 2016-03
 *
 *  @brief get the state of night mode setting from local
 *  从本地配置文件中获取当前夜间模式的设置状态。
 *
 *  @return the bool value isNight?
 */
- (BOOL)getNightModeState {
    self.userDefaults = [NSUserDefaults standardUserDefaults];
    if ([self.userDefaults boolForKey:LSIsNight]) {
        self.isNight = YES;
        [[NSNotificationCenter defaultCenter] postNotificationName:LSNightModeNotification object:nil];
    } else {
        self.isNight = NO;
        [[NSNotificationCenter defaultCenter] postNotificationName:LSDayModeNotification object:nil];
    }
    return self.isNight;
}


/**
 *  @author liushuai1992@gmail.com, 2016-03
 *
 *  @brief change the night mode between day mode and night mode, and return the bool value
 *  从本地配置文件中获取夜间模式的设置状态，并改变状态，发出通知，将改变后的配置写回本地。
 *
 *  @return the bool value isNight?
 */
- (BOOL)changeNightMode {
    //adjust isNightMode value and post notification
    if ([self getNightModeState]) {
        [[NSNotificationCenter defaultCenter] postNotificationName:LSDayModeNotification object:nil];
    } else {
        [[NSNotificationCenter defaultCenter] postNotificationName:LSNightModeNotification object:nil];
    }
    //change the night mode value
    self.isNight = !self.isNight;
    //write the mode value to local file
    [self.userDefaults setBool:self.isNight forKey:LSIsNight];
    //NSLog(@"%@", NSHomeDirectory());
    return self.isNight;
}

@end
