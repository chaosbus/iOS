//
//  LoginView.m
//  贴吧
//
//  Created by Joe on 14-9-9.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "LoginView.h"
#import "RegistView.h"
#import "TBNavViewController.h"

#define MINIMUM_LENGTH_USERNAME     (5) // 用户名最小长度
#define MINIMUM_LENGTH_PASSWORD     (8) // 密码最小长度

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

    self.navigationItem.title = @"登陆";
    if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0)) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    self.loginBtn.backgroundColor = [UIColor grayColor];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillDisappear:animated];

    [self.navigationController setNavigationBarHidden:NO animated:YES];//真是太神奇了，当跳转到广告时，因为广告页是没有Navigationbar的，怎么弄总是有黑框，现在把这个animated的值设为YES居然就没有了 （一定要注意，这个地方如果没有动画效果，即设为NO的话是怎么都会有黑框)

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 点击界面空白退出键盘
- (IBAction)viewTouchDown:(id)sender {
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

#pragma mark - 将键盘退让给下一下TextField
- (IBAction)usernameTextFieldDidEndOnExit:(id)sender {
    [self.passwordTextField becomeFirstResponder];
}

#pragma mark - 将键盘让给调用者，触发登陆按键
- (IBAction)passwordTextFieldDidEndOnExit:(id)sender {
    [sender resignFirstResponder];
    //    [self.loginBtn sendActionsForControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - TextField
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *username = self.usernameTextField.text;
    NSString *password = self.passwordTextField.text;

    
    if (MINIMUM_LENGTH_USERNAME >= username.length || MINIMUM_LENGTH_PASSWORD >= password.length) {
//        self.loginBtn.backgroundColor = [UIColor colorWithRed:(51.0/255.0) green:(153.0/255.0) blue:(204.0/255.0) alpha:1.0];
        self.loginBtn.backgroundColor = [UIColor grayColor];
        [self.loginBtn setEnabled:NO];
//        NSLog(@"shouldChangeCharactersInRange : %@, %@", username, password);
    } else {
        self.loginBtn.backgroundColor = [UIColor greenColor];
        [self.loginBtn setEnabled:YES];
        
    }
    
    return YES;
}

#pragma mark - TextField清除
- (BOOL)textFieldShouldClear:(UITextField *)textField
{
//    self.loginBtn.backgroundColor = [UIColor colorWithRed:(51.0/255.0) green:(153.0/255.0) blue:(204.0/255.0) alpha:1.0];
    self.loginBtn.backgroundColor = [UIColor grayColor];
    self.loginBtn.enabled = NO;
    return YES;
}

#pragma mark - 登陆按键
- (IBAction)login:(id)sender
{
    if (MINIMUM_LENGTH_USERNAME <= self.usernameTextField.text.length && MINIMUM_LENGTH_PASSWORD <= self.passwordTextField.text.length) {
        //进入主菜单
        [self.navigationController presentViewController:navMainTabBar animated:YES completion:Nil];
//      [self.navigationController pushViewController:navMainTabBar animated:YES];
    } else {
        NSLog(@"username or password is too short");
    }
}

#pragma mark - 忘记密码
- (IBAction)forget:(id)sender
{
    
}

#pragma mark - 注册
- (IBAction)regist:(id)sender
{
    RegistView *regView = [[RegistView alloc] init];
    regView.modalTransitionStyle = UIModalTransitionStyleCoverVertical;

    TBNavViewController *navView = [[TBNavViewController alloc] initWithRootViewController:regView];

    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"back" style:UIBarButtonItemStyleBordered target:nil action:nil];
    
    [self.navigationController presentViewController:navView animated:YES completion:^{NSLog(@"去注册！");}];
//    [self.navigationController pushViewController:regView animated:YES];
}

@end
