//
//  TiebaViewController.m
//  贴吧
//
//  Created by Joe on 14-9-10.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "TiebaViewController.h"
#import "UIImageOriginal.h"

@interface TiebaViewController ()

@end

@implementation TiebaViewController

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
    [self addBarButtonItem];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 添加导航键
- (void)addBarButtonItem
{
    
    UIBarButtonItem *postBtn = [[UIBarButtonItem alloc] initWithImage:[UIImageOriginal imageOriginalNamed:@"img_post"]
                                                                style:UIBarButtonItemStyleBordered
                                                               target:nil
                                                               action:nil];
    
    UIBarButtonItem *contentBtn = [[UIBarButtonItem alloc] initWithImage:[UIImageOriginal imageOriginalNamed:@"img_content"]
                                                                   style:UIBarButtonItemStyleBordered
                                                                  target:nil
                                                                  action:nil];

    self.navigationItem.rightBarButtonItems = [[NSArray alloc] initWithObjects:contentBtn, postBtn, nil];
}

@end
