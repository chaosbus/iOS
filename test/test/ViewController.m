//
//  ViewController.m
//  test
//
//  Created by Joe on 15/1/9.
//  Copyright (c) 2015年 Joe. All rights reserved.
//

#import "ViewController.h"
#import "DatePickerView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIView *a = [[UIView alloc] initWithFrame:CGRectMake(0, 100, 100, 100)];
    a.backgroundColor = [UIColor redColor];
    [self.view addSubview:a];
    
    DatePickerView *dpView = [[DatePickerView alloc]init];
    dpView selecteDateOkay
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
