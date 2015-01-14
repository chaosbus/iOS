//
//  FindSubViewViewController.m
//  核心开发手册
//
//  Created by Joe on 14-10-14.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "FindSubViewViewController.h"

@interface FindSubViewViewController ()

@end

@implementation FindSubViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)switchBtn:(id)sender
{
    UISwitch *sw = (UISwitch *)[self.view viewWithTag:100];
    sw.on = !sw.isOn;
    
}

@end
