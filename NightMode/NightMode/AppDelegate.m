//
//  AppDelegate.m
//  NightMode
//
//  Created by liushuai on 16/5/10.
//  Copyright © 2016年 liushuai1992@gmail.com. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "ViewControllerB.h"

@interface AppDelegate ()

@property (nonatomic, strong) UITabBarController *tabBarController;
@property (nonatomic, strong) ViewController *viewControllerA;
@property (nonatomic, strong) ViewControllerB *viewControllerB;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = self.tabBarController;
    return YES;
}

- (UITabBarController *)tabBarController {
    if (!_tabBarController) {
        _tabBarController = [[UITabBarController alloc] init];
        _tabBarController.viewControllers = @[self.viewControllerA, self.viewControllerB];
    }
    return _tabBarController;
}

- (ViewController *)viewControllerA {
    if (!_viewControllerA) {
        _viewControllerA = [[ViewController alloc] init];
        [_viewControllerA setTitle:@"A"];
    }
    return _viewControllerA;
}

- (ViewControllerB *)viewControllerB {
    if (!_viewControllerB) {
        _viewControllerB = [[ViewControllerB alloc] init];
        [_viewControllerB setTitle:@"B"];
    }
    return _viewControllerB;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
