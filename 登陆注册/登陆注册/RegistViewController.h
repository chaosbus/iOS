//
//  RegistViewController.h
//  登陆注册
//
//  Created by Joe on 14-8-11.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegistViewController : UIViewController <UITextFieldDelegate>

- (IBAction)regBack:(id)sender;
- (IBAction)createAccount:(id)sender;

// 登陆用户信息
@property (nonatomic, strong) IBOutlet UITextField *username;
@property (nonatomic, strong) IBOutlet UITextField *password;

@property (nonatomic, strong) IBOutlet UIButton *createAccount;

- (IBAction)kbUserTextField:(id)sender;
- (IBAction)kbPwdsTextField:(id)sender;

- (IBAction)kbHide:(id)sender;
@end
