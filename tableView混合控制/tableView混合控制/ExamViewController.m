//
//  ExamViewController.m
//  tableView混合控制
//
//  Created by Joe on 14-8-11.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "ExamViewController.h"

@interface ExamViewController ()

@end

@implementation ExamViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //[_isSave setSelected:YES];
    
    //[_isSave addTarget:self action:@selector(check:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    UIButton *checkbox = [UIButton buttonWithType:UIButtonTypeCustom];
    
    CGRect checkboxRect = CGRectMake(135,150,36,36);
    [checkbox setFrame:checkboxRect];
    
    [checkbox setImage:[UIImage imageNamed:@"checkbox_off.png"] forState:UIControlStateNormal];
    [checkbox setImage:[UIImage imageNamed:@"checkbox_on.png"] forState:UIControlStateSelected];
    
    [checkbox addTarget:self action:@selector(checkboxClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:checkbox];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)checkboxClick:(UIButton *)btn
{
    btn.selected = !btn.selected;
}

@end
