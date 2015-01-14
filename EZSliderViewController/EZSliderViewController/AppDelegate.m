//
//  AppDelegate.m
//  EZSliderViewController
//
//  Created by Joe on 14/10/24.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "AppDelegate.h"
#import "EZSideViewController.h"
#import "MainViewController.h"
#import "LeftViewController.h"
#import "RightViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MainViewController *mainViewController = [storyBoard instantiateViewControllerWithIdentifier:@"root"];
//    mainViewController.view.backgroundColor = [UIColor redColor];
//    ViewController *mainViewController=[[ViewController alloc]initWithNibName:@"root" bundle:nil];
//    mainViewController.view.backgrundColor=[UIColor grayColor];
    
    LeftViewController *leftViewController = [storyBoard instantiateViewControllerWithIdentifier:@"left"];
    leftViewController.view.backgroundColor =[UIColor brownColor];
    
    RightViewController *rightViewController = [storyBoard instantiateViewControllerWithIdentifier:@"right"];
    rightViewController.view.backgroundColor = [UIColor purpleColor];
    
    _sideViewController=[[EZSideViewController alloc] init];
    _sideViewController.rootVC = mainViewController;
    _sideViewController.leftVC = leftViewController;
    _sideViewController.rightVC = rightViewController;
    
    _sideViewController.needScale = true;
    
    //动画效果可以被自己自定义，具体请看api
    
    
    self.window.rootViewController=_sideViewController;
    
    
    [self.window makeKeyAndVisible];
    return YES;

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
