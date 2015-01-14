//
//  CurrencyConvertorViewController.m
//  汇率换算
//
//  Created by Joe on 14/10/23.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "CurrencyConvertorViewController.h"
#import "SettingTableViewController.h"
#import "CCTopView.h"
#import "TopViewController.h"

@interface CurrencyConvertorViewController ()

@end

@implementation CurrencyConvertorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"xCurrencyConvertor";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addBarButtonItem];
    [self addTopView];
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


- (void)addTopView
{
#if 0
    CCTopView *topView = [[CCTopView alloc] initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, 300)];
#else
    TopViewController *topView = [[TopViewController alloc] init];
#endif
    [self.view addSubview:topView.view];
}


#pragma makr - 添加导航左右键
- (void)addBarButtonItem
{
//    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc]
//                                initWithTitle:@"目录"
//                                style:UIBarButtonItemStyleBordered
//                                target:self
//                                action:@selector(setting)];
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc]
                          initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize
                          target:self
                          action:@selector(goSettings)];
    self.navigationItem.leftBarButtonItem = leftBtn;
}

- (void)goSettings
{
    SettingTableViewController *settingVC = [[SettingTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    settingVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    UINavigationController *modalNav = [[UINavigationController alloc] initWithRootViewController:settingVC];
    
    [self.navigationController presentViewController:modalNav animated:YES completion:nil];
}


@end
