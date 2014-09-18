//
//  TestViewController.m
//  贴吧
//
//  Created by Joe on 14-9-10.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

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
    // Do any additional setup after loading the view from its nib.
    
    [self addBarButtonItem];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 添加导航左右键
- (void)addBarButtonItem
{
//    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc]
//                                initWithTitle:@"Left"
//                                style:UIBarButtonItemStyleBordered
//                                target:self
//                                action:nil];
//    self.navigationItem.leftBarButtonItem = leftBtn;

    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]
                                 initWithTitle:@"Right"
                                 style:UIBarButtonItemStyleBordered
                                 target:self
                                 action:nil];
    self.navigationItem.rightBarButtonItem = rightBtn;
}

@end
