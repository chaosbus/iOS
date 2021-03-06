//
//  ViewController.m
//  核心开发手册
//
//  Created by Joe on 14-9-26.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 一个类只会调用一次
+ (void)initialize
{
#if 0
    [[UINavigationBar appearance] setBackgroundColor:[UIColor blackColor]];
    [[UINavigationBar appearance] setTintColor:[UIColor redColor]];
    [[UINavigationBar appearance] setBarTintColor:[[UIColor cyanColor] colorWithAlphaComponent:0.5f]];
#else
    // 1.取出设置主题的对象
    UINavigationBar *navBar = [UINavigationBar appearance];
    
    // 2.设置导航栏的背景图片
    navBar.tintColor = [UIColor redColor];
    navBar.barTintColor = [UIColor cyanColor];
//    navBar.translucent = YES;
//    navBar.barStyle = UIBarStyleDefault;

    // 3.标题
    [navBar setTitleTextAttributes:@{UITextAttributeTextColor : [UIColor blueColor]}];
#endif
}

#pragma mark 控制状态栏的样式
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

@end
