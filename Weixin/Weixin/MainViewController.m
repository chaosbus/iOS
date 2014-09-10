//
//  MainViewController.m
//  Weixin
//
//  Created by Joe on 14-9-3.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "MainViewController.h"
#import "WeixinViewController.h"
#import "ContactViewController.h"
#import "FindViewController.h"
#import "AboutMeViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

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
        WeixinViewController *weixinView = [[WeixinViewController alloc] init];
        UIImage *wxSelImg = [[UIImage imageNamed:@"CoteDIvoire"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage *wxUnSelImg = [[UIImage imageNamed:@"Honduras"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        weixinView.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"微信"
                                                              image:wxUnSelImg
                                                      selectedImage:wxSelImg];
        [self addChildViewController:weixinView];
        
        ContactViewController *contactView = [[ContactViewController alloc] init];
        UIImage *ctSelImg = [[UIImage imageNamed:@"Nigeria"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage *ctUnSelImg = [[UIImage imageNamed:@"Chile"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        contactView.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"通讯录"
                                                               image:ctUnSelImg
                                                       selectedImage:ctSelImg];
        [self addChildViewController:contactView];
        
        FindViewController *findView = [[FindViewController alloc] init];
        UIImage *findSelImg = [[UIImage imageNamed:@"NewZealand"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage *findUnSelImg = [[UIImage imageNamed:@"Mexico"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        findView.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"查找"
                                                            image:findUnSelImg
                                                    selectedImage:findSelImg];
        [self addChildViewController:findView];
    
        AboutMeViewController *aboutmeView = [[AboutMeViewController alloc] init];
        UIImage *meSelImg = [[UIImage imageNamed:@"Nigeria"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage *meUnSelImg = [[UIImage imageNamed:@"Holland"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        aboutmeView.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我"
                                                               image:meUnSelImg
                                                       selectedImage:meSelImg];
        [self addChildViewController:aboutmeView];
    }
    
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        UINavigationItem *navBar = self.navigationItem;
        navBar.title = @"haha";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
