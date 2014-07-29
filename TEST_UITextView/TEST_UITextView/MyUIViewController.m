//
//  MyUIViewController.m
//  TEST_UITextView
//
//  Created by Joe on 14-7-23.
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
- (IBAction)click1:(id)sender {
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"Return");
    [textField resignFirstResponder];
    return YES;
}


@end
