//
//  LoginViewController.m
//  Weixin
//
//  Created by Joe on 14-9-3.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "LoginViewController.h"
#import "MainViewController.h"

@interface LoginViewController ()
{
    CGFloat loginViewMoveY;
}

@end

@implementation LoginViewController

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
//    self.scrollView.contentSize = CGSizeMake(320, 800);
//    [self.loginBtn setHidden:YES];
//    [self.loginBtn setEnabled:NO];
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loginBtnAct:(id)sender
{
    NSLog(@"Account[%@]\nPassword[%@]\n", _username.text, _password.text);
    
    MainViewController *mainView = [[MainViewController alloc] init];
//    [self presentModalViewController:mainView animated:YES];
//    [self presentViewController:mainView animated:YES completion:nil];
    [self.navigationController pushViewController:mainView animated:YES];
    NSLog(@"push");
}

- (void)registBtnAct:(id)sender
{
    
}

#pragma mark - 点击界面退出键盘
- (IBAction)viewTouchDown:(id)sender {
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

#pragma mark - 将键盘退让给下一下TextField
- (IBAction)usernameTextFieldDidEndOnExit:(id)sender {
    [self.password becomeFirstResponder];
}

#pragma mark - 将键盘让给调用者，触发登陆按键
- (IBAction)passwordTextFieldDidEndOnExit:(id)sender {
    [sender resignFirstResponder];
    if ([_username.text length] && [_password.text length]) {
        self.loginBtn.backgroundColor = [UIColor greenColor];
        [self.loginBtn setEnabled:YES];
    } else {
        [self.loginBtn setEnabled:NO];
    }

//    [self.loginBtn sendActionsForControlEvents:UIControlEventTouchUpInside];
}

#define KEYBOARD_HEIGHT   216   // 键盘高216

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    CGRect frame = self.loginView.frame;
    CGFloat offsetUserTextField = self.username.frame.origin.y + self.username.frame.size.height;
    CGFloat offsetPwdsTextField = self.password.frame.origin.y + self.password.frame.size.height;
    CGFloat offsetLoginBtn = self.loginBtn.frame.origin.y + self.loginBtn.frame.size.height;
    
    loginViewMoveY = frame.origin.y;
    CGFloat offset = 0;
    CGFloat leftSpaceY = frame.size.height - KEYBOARD_HEIGHT;
//    NSLog(@"user:%i, pwds:%i, Y-axis:%i, left:%i  [%i]", (int)offsetUserTextField, (int)offsetPwdsTextField, (int)frame.origin.y, (int)leftSpaceY, (int)loginViewMoveY);
    

    if ([self.username isEditing]) {
//        NSLog(@"user selected");
        if (leftSpaceY < offsetUserTextField) {
//            NSLog(@"Username被遮挡");
            offset = offsetUserTextField - leftSpaceY;
        }
    } else if ([self.password isEditing]) {
//        NSLog(@"pwds selected");
        if (leftSpaceY < offsetPwdsTextField) {
//            NSLog(@"password被遮挡");
            offset = offsetPwdsTextField - leftSpaceY;
//            offset = offsetLoginBtn - leftSpaceY;
        }
    }
//    NSLog(@"offset : %i", (int)offset);
    if (offset) {
        self.loginView.frame = CGRectMake(0, loginViewMoveY - offset, frame.size.width, frame.size.height);
    }

}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
//    CGRect frame = self.view.frame;
    self.loginView.frame = CGRectMake(0, loginViewMoveY, self.loginView.frame.size.width, self.loginView.frame.size.height);
}

@end
