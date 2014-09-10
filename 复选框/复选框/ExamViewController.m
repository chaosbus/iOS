//
//  ExamViewController.m
//  复选框
//
//  Created by Joe on 14-8-12.
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
    
    
    UIButton *checkbox = [UIButton buttonWithType:UIButtonTypeCustom];
    
    CGRect checkboxRect = CGRectMake(135,150,36,36);
    [checkbox setFrame:checkboxRect];
    
    [checkbox setImage:[UIImage imageNamed:@"sel.png"] forState:UIControlStateNormal];
    [checkbox setImage:[UIImage imageNamed:@"unsel.png"] forState:UIControlStateSelected];
    
    checkbox.titleLabel.text = @"haha:";
    
    [checkbox addTarget:self action:@selector(checkboxClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:checkbox];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)checkboxClick:(UIButton *)btn
{
    btn.selected = !btn.selected;
    
    if (!btn.isSelected) {
        NSLog(@"--- 选中");
    } else
        NSLog(@"--- 未选中");
}
- (void)cb1click:(UIButton *)btn
{
    NSLog(@"click1");
    btn.selected = !btn.selected;
    
    if (btn.isSelected) {
        NSLog(@"=== 选中");
        [btn setImage:[UIImage imageNamed:@"sel.png"] forState:UIControlStateNormal];

    } else {
        NSLog(@"=== 未选中");
        [btn setImage:[UIImage imageNamed:@"unsel.png"] forState:UIControlStateSelected];
    }

}
@end
