//
//  ViewController.m
//  EZSliderViewController
//
//  Created by Joe on 14/10/24.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "MainViewController.h"
#import "EZSideViewController.h"
#import "AppDelegate.h"

@interface MainViewController ()
{
    EZSideViewController *_sliderVC;
}
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    AppDelegate *delegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];

    _sliderVC = [delegate sideViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickLeft:(id)sender
{
    [_sliderVC showLeftViewController:true];
    NSLog(@"%s", __func__);
}

- (IBAction)clickRight:(id)sender
{
    [_sliderVC showRightViewController:true];
    NSLog(@"%s", __func__);
}

@end
