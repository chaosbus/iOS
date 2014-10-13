//
//  RectViewController.m
//  核心开发手册
//
//  Created by Joe on 14-10-11.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "RectViewController.h"

@interface RectViewController ()

@end

@implementation RectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self myview];
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

#define INSET_AMT   1.5f
- (void)myview
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    CGRect myRec = CGRectMake(100, 200, 160, 200);
    UIView *myView = [[UIView alloc] initWithFrame:myRec];
    myView.backgroundColor = [UIColor grayColor];
    
    CGRect myRecOffset = CGRectOffset(myRec, 80, 100);
    UIView *myViewOffset = [[UIView alloc] initWithFrame:myRecOffset];
    myViewOffset.backgroundColor = [UIColor purpleColor];
    
    
    [self.view addSubview:myViewOffset];
    [self.view addSubview:myView];
    
    CGRect mr1 = CGRectInset(myRec, 2.0f * INSET_AMT, 2.0f * INSET_AMT);
    UIView *mv1 = [[UIView alloc] initWithFrame:mr1];
    mv1.backgroundColor = [UIColor redColor];
    [self.view addSubview:mv1];

    CGRect mr2 = CGRectInset(myRec, 10.0f * INSET_AMT, 10.0f * INSET_AMT);
    UIView *mv2 = [[UIView alloc] initWithFrame:mr2];
    mv2.backgroundColor = [UIColor greenColor];
    [self.view addSubview:mv2];
}



@end
