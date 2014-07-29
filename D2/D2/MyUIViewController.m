//
//  MyUIViewController.m
//  D2
//
//  Created by Joe on 14-7-16.
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


- (IBAction)testAlertView:(id)sender
{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Alert Title" message:@"get out of my box" delegate:self cancelButtonTitle:@"cancelBut" otherButtonTitles:@"otherBut", nil];
    
    [alertView show];
}


#pragma mark-- 
- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"buttonIndex = %i", buttonIndex);
}


@end
