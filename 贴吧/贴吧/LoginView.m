//
//  LoginView.m
//  贴吧
//
//  Created by Joe on 14-9-9.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "LoginView.h"
#import "TBAppDelegate.h"

@interface LoginView ()

@end

@implementation LoginView

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
//    self.navigationController.navigationBarHidden = YES;
//    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
//                                                                     [UIColor whiteColor], UITextAttributeTextColor,
//                                                                     [UIColor grayColor],   UITextAttributeTextShadowColor,
//                                                                     [NSValue valueWithUIOffset:UIOffsetMake(1, 1)], UITextAttributeTextShadowOffset,
////                                                                     [UIFont fontWithName:@"Arial-Bold" size:0.0],   UITextAttributeFont,
//                                                                     nil]];

    self.navigationItem.title = @"Login";
    if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0)) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)login:(id)sender
{
//    MainTabBar *mainView = [[MainTabBar alloc] init];
//    [self.navigationController pushViewController:mainView animated:YES];
//    TBNavViewController *navView = [[TBNavViewController alloc] initWithRootViewController:mainView];
//    navView.navigationBar.barTintColor = [UIColor blackColor];
//    [self.navigationController presentViewController:mainView animated:YES completion:Nil];
    
//    self.navigationItem.backBarButtonItem;
//    [self.navigationItem setBackBarButtonItem:nil];

//    TBAppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
//    [appDelegate.navigationController pushViewController:mainView animated:YES];
    
    //进入主菜单
    [self.navigationController presentViewController:navMainTabBar animated:YES completion:Nil];

}

@end
