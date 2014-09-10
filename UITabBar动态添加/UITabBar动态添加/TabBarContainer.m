//
//  TabBarContainer.m
//  UITabBar动态添加
//
//  Created by Joe on 14-8-5.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "TabBarContainer.h"

#import "Bar1ViewController.h"
#import "Bar2ViewController.h"


@interface TabBarContainer ()

@end

@implementation TabBarContainer

- (id)init
{
    if (self = [super init]) {
        /* 添加子控制器，tabbaritem */
        Bar1ViewController *bar1 = [[Bar1ViewController alloc] init];
        bar1.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:0];
        [self addChildViewController:bar1];

        Bar2ViewController *bar2 = [[Bar2ViewController alloc] init];
        //bar2.tabBarItem.title = @"haha";
//        bar2.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMore tag:1];
        bar2.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"hahaha" image:[UIImage imageNamed:@"Chile"] selectedImage:[UIImage imageNamed:@"111"]];

        [self addChildViewController:bar2];
    }

    return self;
}


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

@end
