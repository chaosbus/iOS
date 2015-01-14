//
//  MainViewController.m
//  计算器V1
//
//  Created by Joe on 14/10/29.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "MainViewController.h"
#import "EZSideViewController.h"
#import "AppDelegate.h"

@interface MainViewController ()
{
    EZSideViewController *_sideVC;
}
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:0.3 green:0.4 blue:0.5 alpha:1];
    self.title = @"Calc";
    
    
    AppDelegate *delegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    _sideVC = [delegate sideViewController];
    
    [self addBarButtonItem];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma makr - 添加导航左右键
- (void)addBarButtonItem
{
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc]
                                initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize
                                target:self
                                action:@selector(goSettings)];
    self.navigationItem.leftBarButtonItem = leftBtn;
}

- (void)goSettings
{
    [_sideVC showLeftViewController:true];
}



@end
