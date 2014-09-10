//
//  viewViewController.m
//  scroll
//
//  Created by Joe on 14-9-5.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "viewViewController.h"

@interface viewViewController ()

@end

@implementation viewViewController

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
    self.scrollView.contentSize = CGSizeMake(320, 600);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//-(void)viewDidAppear:(BOOL)animated
//{
//    
//    [self.scrollView setContentOffset:CGPointMake(0, 110) animated:YES];
//    //self.scrollView.contentOffset = CGPointMake(0, 110);
//    NSLog(@" self.scrollView.contentSize %f,%f", self.scrollView.contentSize.height, self.scrollView.contentSize.width);
//    
//    [super viewDidAppear:YES];
//    
//}



- (IBAction)hideKeyboard:(id)sender {
    NSLog(@"Tap in view");
    [self hideKeyboardView];
}

- (void)hideKeyboardView
{
    // 方法一：
    [self.scrollView  resignFirstResponder];
}
@end
