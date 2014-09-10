//
//  PrefixViewController.m
//  SigleViewTsst
//
//  Created by Joe on 14-8-21.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "PrefixViewController.h"

@interface PrefixViewController ()

@end

@implementation PrefixViewController

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


- (IBAction)btn1Act:(id)sender
{
    NSString *input = self.inputText.text;
    NSLog(input);
    NSLog(@"ENTER\n");
}


- (void)btn2Act:(id)sender
{
    _label1.text = @"....";
    self.label1.text = @"haha";
    NSLog(@"OK\n");
}

@end
