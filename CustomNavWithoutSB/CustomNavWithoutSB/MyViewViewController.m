//
//  MyViewViewController.m
//  CustomNavWithoutSB
//
//  Created by Joe on 14-9-9.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "MyViewViewController.h"

@interface MyViewViewController ()

@end

@implementation MyViewViewController

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
    self.navigationItem.title = @"98765";
//    self.navigationController.navigationBar.titleTextAttributes = [UIColor greenColor];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                    [UIColor redColor], UITextAttributeTextColor,
//                                    [UIColor blueColor],   UITextAttributeTextShadowColor,
//                                    [NSValue valueWithUIOffset:UIOffsetMake(0, 0)], UITextAttributeTextShadowOffset,
//                                    [UIFont fontWithName:@"Arial-Bold" size:0.0],   UITextAttributeFont,
                                    nil]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
