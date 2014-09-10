//
//  MainTabBar.m
//  贴吧
//
//  Created by Joe on 14-9-9.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "MainTabBar.h"
#import "TBNavViewController.h"
#import "JinbaViewController.h"
#import "MoreViewController.h"

@interface MainTabBar ()

@end

@implementation MainTabBar

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = NO;
    if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0)) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
//    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
//                                                                     [UIColor whiteColor], UITextAttributeTextColor,
//                                                                     [UIColor blueColor],   UITextAttributeTextShadowColor,
//                                                                     [NSValue valueWithUIOffset:UIOffsetMake(1, 1)], UITextAttributeTextShadowOffset,
//                                                                     //                                                                     [UIFont fontWithName:@"Arial-Bold" size:0.0],   UITextAttributeFont,
//                                                                     nil]];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (id)init
{
    if (self = [super init]) {
#pragma mark - 添加子控制器，tabbaritem
        /*
         * 默认图片显示是灰色，选中是蓝色，需要自己修改图片属性
         * By default, the actual unselected and selected images are automatically
         * created from the alpha values in the source images. To prevent system coloring,
         * provide images with UIImageRenderingModeAlwaysOriginal.
         */
        JinbaViewController *jinbaView = [[JinbaViewController alloc] init];
        TBNavViewController *jinbaNavView = [[TBNavViewController alloc] initWithRootViewController:jinbaView];
        UIImage *wxSelImg = [[UIImage imageNamed:@"CoteDIvoire"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage *wxUnSelImg = [[UIImage imageNamed:@"Honduras"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        jinbaView.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"进吧"
                                                              image:wxUnSelImg
                                                      selectedImage:wxSelImg];
        [self addChildViewController:jinbaView];
        
        MoreViewController *moreView = [[MoreViewController alloc] init];
        TBNavViewController *moreNavView = [[TBNavViewController alloc] initWithRootViewController:moreView];
        UIImage *ctSelImg = [[UIImage imageNamed:@"Nigeria"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage *ctUnSelImg = [[UIImage imageNamed:@"Chile"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        moreView.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"更多"
                                                               image:ctUnSelImg
                                                       selectedImage:ctSelImg];
        [self addChildViewController:moreView];

        UITabBarController *tabBarController = [[UITabBarController alloc] init];
        tabBarController.viewControllers = [NSArray arrayWithObjects:jinbaNavView, moreNavView, nil];
//        [self.view addSubview:tabBarController.view];

        
//        FindViewController *findView = [[FindViewController alloc] init];
//        UIImage *findSelImg = [[UIImage imageNamed:@"NewZealand"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//        UIImage *findUnSelImg = [[UIImage imageNamed:@"Mexico"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//        findView.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"查找"
//                                                            image:findUnSelImg
//                                                    selectedImage:findSelImg];
//        [self addChildViewController:findView];
//        
//        AboutMeViewController *aboutmeView = [[AboutMeViewController alloc] init];
//        UIImage *meSelImg = [[UIImage imageNamed:@"Nigeria"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//        UIImage *meUnSelImg = [[UIImage imageNamed:@"Holland"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//        aboutmeView.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我"
//                                                               image:meUnSelImg
//                                                       selectedImage:meSelImg];
//        [self addChildViewController:aboutmeView];
    }
    
    return self;
}

@end
