//
//  LoginViewController.h
//  Weixin
//
//  Created by Joe on 14-9-3.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController <UITextFieldDelegate>//, UIScrollViewDelegate, UINavigationBarDelegate, UINavigationControllerDelegate, UIScrollViewAccessibilityDelegate>

@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIImageView *headImg;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *registBtn;
@property (weak, nonatomic) IBOutlet UIButton *helpLoginBtn;
@property (weak, nonatomic) IBOutlet UIButton *changeAccountBtn;

@property (weak, nonatomic) IBOutlet UIView *loginView;

- (IBAction)loginBtnAct:(id)sender;
- (IBAction)registBtnAct:(id)sender;

#pragma mark - 以下为隐藏键盘方法
- (IBAction)usernameTextFieldDidEndOnExit:(id)sender;
- (IBAction)passwordTextFieldDidEndOnExit:(id)sender;
- (IBAction)viewTouchDown:(id)sender;

@end
