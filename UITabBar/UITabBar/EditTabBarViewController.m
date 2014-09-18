//
//  EditTabBarViewController.m
//  UITabBar
//
//  Created by Joe on 14-8-5.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "EditTabBarViewController.h"

@interface EditTabBarViewController ()

@end

@implementation EditTabBarViewController

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
    [self aaaaa];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)aaaaa
{
    UIImage *img=[UIImage imageNamed:@"bubbleMine"];
    img=[img stretchableImageWithLeftCapWidth:21 topCapHeight:16];
    UIImageView *imgView=[[UIImageView alloc]initWithImage:img];
    [imgView setFrame:CGRectMake(10, 10, 200, 100)];
    imgView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:imgView];
    
    UIImageView *_bubbleView = [[UIImageView alloc] initWithFrame:CGRectZero];

    CGRect bubbleRect = CGRectMake(30, 200, 100, 80);
    //    [_bubbleView setImage:[[UIImage imageNamed:@"bubbleMine"]stretchableImageWithLeftCapWidth:20 topCapHeight:30]];
    _bubbleView.frame = bubbleRect;
    _bubbleView.image = [[UIImage imageNamed:@"bubbleMine"]stretchableImageWithLeftCapWidth:21 topCapHeight:16];
    _bubbleView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_bubbleView];
}
@end
