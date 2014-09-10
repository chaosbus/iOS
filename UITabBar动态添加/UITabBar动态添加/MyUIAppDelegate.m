//
//  MyUIAppDelegate.m
//  UITabBar动态添加
//
//  Created by Joe on 14-8-5.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "MyUIAppDelegate.h"
#import "TabBarContainer.h"
//#import "Bar1ViewController.h"
//#import "Bar2ViewController.h"

@implementation MyUIAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
//    self.window.backgroundColor = [UIColor whiteColor];
    
    
    /* 设置父容器 */
    TabBarContainer *tabCtrl = [[TabBarContainer alloc] init];
    
//    /* 添加子控制器，tabbaritem */
//    Bar1ViewController *bar1 = [[Bar1ViewController alloc] init];
//    bar1.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:2];
//    [tabCtrl addChildViewController:bar1];
//    
//    Bar2ViewController *bar2 = [[Bar2ViewController alloc] init];
//    bar2.tabBarItem.title = @"haha";
//    //bar2.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMore tag:1];
//    [tabCtrl addChildViewController:bar2];
//    
//    
    /* 设置根控制器为上面的父容器*/
    self.window.rootViewController = tabCtrl;
    
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
