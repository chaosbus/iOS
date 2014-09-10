//
//  RegistViewController.m
//  登陆注册
//
//  Created by Joe on 14-8-11.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "RegistViewController.h"

@interface RegistViewController ()

@end

@implementation RegistViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.username.delegate = self;
        self.password.delegate = self;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (void)regBack:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{NSLog(@"退出注册页面，返回登陆界面");}];
}

- (void)createAccount:(id)sender
{
    NSLog(@"createAccount user[%@} pwds[%@]", _username.text, _password.text);
}


#pragma mark - 点击Return自动转到下个文本框
- (IBAction)kbUserTextField:(id)sender {
    [self.password becomeFirstResponder];
}

- (IBAction)kbPwdsTextField:(id)sender {
    [self.createAccount sendActionsForControlEvents:UIControlEventTouchUpInside];
}


- (void)kbHide:(id)sender
{
    // 发送resignFirstResponder.
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}


- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    ;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    ;
}


@end
