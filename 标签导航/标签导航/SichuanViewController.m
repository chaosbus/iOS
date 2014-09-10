//
//  SichuanViewController.m
//  标签导航
//
//  Created by Joe on 14-8-13.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "SichuanViewController.h"

@interface SichuanViewController ()

@end

@implementation SichuanViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.tabBarItem.title = @"四川";
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
