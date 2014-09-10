//
//  YunnanViewController.m
//  标签导航
//
//  Created by Joe on 14-8-13.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "YunnanViewController.h"

@interface YunnanViewController ()

@end

@implementation YunnanViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.tabBarItem.title = @"云南";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
