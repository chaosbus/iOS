//
//  SliderViewController.m
//  核心开发手册
//
//  Created by Joe on 14-9-26.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "SliderViewController.h"
#import "DiySlider.h"

@interface SliderViewController ()
{
    DiySlider *slider;
}
@end

@implementation SliderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addSlider];
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

- (void)addSlider
{
    slider = [DiySlider initSlider];
    
    [self.view addSubview:slider];
}

@end
