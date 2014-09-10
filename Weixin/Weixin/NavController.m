//
//  NavController.m
//  Weixin
//
//  Created by Joe on 14-9-4.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "NavController.h"

@interface NavController ()

@end

@implementation NavController
//
//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}
//
//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    // Do any additional setup after loading the view.
//}
//
//- (void)didReceiveMemoryWarning
//{
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

+ (void)initialize
{
    // 1.取出设置主题的对象
    UINavigationBar *navBar = [UINavigationBar appearance];
    
    // 2.设置导航栏的背景图片
//    NSString *navBarBg = nil;
//    if (iOS7) { // iOS7
//        navBarBg = @"NavBar64";
//        navBar.tintColor = [UIColor whiteColor];
//    } else { // 非iOS7
//        navBarBg = @"NavBar";
//        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleBlackOpaque;
//    }
//    [navBar setBackgroundImage:[UIImage imageNamed:navBarBg] forBarMetrics:UIBarMetricsDefault];
    
    // 3.标题
//    [navBar setTitleTextAttributes:@{UITextAttributeTextColor : [UIColor redColor]}];
//    [navBar setBackgroundColor:[UIColor blackColor]];
//    [navBar setBackgroundImage:[UIImage imageNamed:@"ToolViewBkg@2x"] forBarMetrics:UIBarMetricsLandscapePhone];
//    navBar.tintColor = [UIColor redColor];
    [navBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                    [UIColor purpleColor], UITextAttributeTextColor,
                                    [UIColor blueColor],   UITextAttributeTextShadowColor,
                                    [NSValue valueWithUIOffset:UIOffsetMake(0, 0)], UITextAttributeTextShadowOffset,
                                    [UIFont fontWithName:@"Arial-Bold" size:0.0],   UITextAttributeFont,
                                    nil]];
//    navBar.translucent = YES;
    
//    navBar.barStyle = UIBarStyleBlackTranslucent;
    

    
//    [navBar setBackgroundColor:[UIColor greenColor]];
}

//#pragma mark 控制状态栏的样式
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
