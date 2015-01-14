//
//  Touch2ViewController.m
//  核心开发手册
//
//  Created by Joe on 14/10/21.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "Touch2ViewController.h"
#import "Drag2View.h"

@interface Touch2ViewController ()

@end

@implementation Touch2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self img];
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

- (void)img
{
    Drag2View *dv = [[Drag2View alloc] initWithImage:[UIImage imageNamed:@"sun"]];
    dv.center = self.view.center;
    
    [self.view addSubview:dv];
}

@end
