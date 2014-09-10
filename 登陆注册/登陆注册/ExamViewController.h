//
//  ExamViewController.h
//  登陆注册
//
//  Created by Joe on 14-8-11.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExamViewController : UIViewController

- (IBAction)login:(id)sender;
- (IBAction)regist:(id)sender;
- (IBAction)forget:(id)sender;
- (IBAction)kbExit:(id)sender;

// 登陆用户信息
@property (nonatomic, strong) IBOutlet UITextField *username;
@property (nonatomic, strong) IBOutlet UITextField *password;

// 复选框
@property (nonatomic, weak) IBOutlet UIButton *checkboxPassword;
@property (nonatomic, weak) IBOutlet UIButton *checkboxAutologin;

@property (nonatomic, strong) IBOutlet UIButton *loginBtn;



@end
