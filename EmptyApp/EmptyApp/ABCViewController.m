//
//  ABCViewController.m
//  EmptyApp
//
//  Created by Joe on 14-8-21.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "ABCViewController.h"
#import "ShowView1.h"

@interface ABCViewController ()

@end

@implementation ABCViewController

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
    
    
    // 1
    CGRect view1Rect = CGRectMake(10, 20, 30, 40);
    ShowView1 *view1 = [[ShowView1 alloc] initWithFrame:view1Rect];
    view1.backgroundColor = [UIColor purpleColor];
    
    [self.view addSubview:view1];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
