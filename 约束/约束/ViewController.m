//
//  ViewController.m
//  约束
//
//  Created by Joe on 15/1/12.
//  Copyright (c) 2015年 Joe. All rights reserved.
//

#import "ViewController.h"

#define LENG      44.0f
@interface ViewController ()
@property (nonatomic) UIView *v1;
@property (nonatomic) UIView *v2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIView *baseView = [[UIView alloc] initWithFrame:CGRectMake(10, 100, 300, 250)];
    [self.view addSubview:baseView];
    baseView.backgroundColor = [UIColor darkGrayColor];
//    baseView.translatesAutoresizingMaskIntoConstraints = NO;
    
    _v1 = [[UIView alloc] init];
    _v1.backgroundColor = [UIColor redColor]; //colorWithAlphaComponent:0.4];
    _v1.translatesAutoresizingMaskIntoConstraints = NO;
    [baseView addSubview:_v1];
    
    
    _v2 = [[UIView alloc] init];
    _v2.backgroundColor = [UIColor greenColor];// colorWithAlphaComponent:0.4];
    _v2.translatesAutoresizingMaskIntoConstraints = NO;
    [baseView addSubview:_v2];
    
    
    NSMutableArray *array = [NSMutableArray array];
    [array addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[_v1(==100)][_v2]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_v1, _v2)]];
    
    [array addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_v1]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_v1)]];
    [array addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-30-[_v2(==_v1)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_v1, _v2)]];
    
    [baseView addConstraints:array];
    
    NSDate * now = [NSDate date];
    NSDate * anHourAgo = [now dateByAddingTimeInterval:-60*60];
    NSTimeInterval timeBetween = [now timeIntervalSinceDate:anHourAgo];
    NSComparisonResult result3 = [now compare:anHourAgo];
    NSLog(@".... %f, %f, %ld", timeBetween, timeBetween/24/60/60, result3);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
