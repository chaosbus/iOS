//
//  ButtonViewController.m
//  核心开发手册
//
//  Created by Joe on 14-9-26.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "ButtonViewController.h"
#import "AnimateButton.h"

@interface ButtonViewController ()
{
    AnimateButton *btn;
}
@end

@implementation ButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.navigationItem.title = @"on";
    [self addButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)myTitle:(AnimateButton *)button
{
    self.navigationItem.title = (button.isOn == YES) ? @"on" : @"off";
}

- (void)addButton
{
    btn = [AnimateButton initButton];
    [self.view addSubview:btn];
    
    [btn addTarget:self action:@selector(myTitle:) forControlEvents:UIControlEventTouchUpInside];
}

- (void) recenter
{
    btn.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds));

}

- (void) viewDidAppear:(BOOL)animated
{
    [self recenter];
}

- (void) didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    [self recenter];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}


@end
