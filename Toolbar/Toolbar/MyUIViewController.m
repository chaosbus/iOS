//
//  MyUIViewController.m
//  Toolbar
//
//  Created by Joe on 14-7-17.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "MyUIViewController.h"

@interface MyUIViewController ()

@end

@implementation MyUIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)save:(id)sender
{
    self.label.text = @"click save";
}

- (IBAction)open:(id)sender
{
    self.label.text = @"click open";
}

- (IBAction)saveNavi:(id)sender
{
    self.labelNavi.text = @"navi SAVE";
}

- (IBAction)addNave:(id)sender
{
    self.labelNavi.text = @"navi ADD";
}

@end
