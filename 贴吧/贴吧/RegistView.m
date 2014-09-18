//
//  RegistView.m
//  贴吧
//
//  Created by Joe on 14-9-12.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "RegistView.h"

@interface RegistView ()

@end

@implementation RegistView

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
    
    self.navigationItem.title = @"注册";

//    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
//    [self addBarButtonItem];
}

//- (void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillDisappear:animated];
//    
//    [self.navigationController setNavigationBarHidden:YES animated:YES];//真是太神奇了，当跳转到广告时，因为广告页是没有Navigationbar的，怎么弄总是有黑框，现在把这个animated的值设为YES居然就没有了 （一定要注意，这个地方如果没有动画效果，即设为NO的话是怎么都会有黑框)
//    
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doneRegist:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{NSLog(@"注册完了");}];
}

#pragma makr - 添加导航左右键
- (void)addBarButtonItem
{
//    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc]
//                                 initWithTitle:@"一键签到"
//                                 style:UIBarButtonItemStyleBordered
//                                 target:self
//                                 action:nil];
    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonItemStyleDone target:self action:nil];
    self.navigationItem.leftBarButtonItem = backBtn;
}


@end
