//
//  ExamViewController.m
//  登陆注册
//
//  Created by Joe on 14-8-11.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "ExamViewController.h"
#import "RegistViewController.h"

@interface ExamViewController ()

//@property (nonatomic) NSInteger *isSavePwd;
//@property (nonatomic) NSInteger *isSavePwd;
@end

@implementation ExamViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    /**/
    [_checkboxPassword setImage:[UIImage imageNamed:@"unsel"] forState:UIControlStateNormal];
    [_checkboxPassword setImage:[UIImage imageNamed:@"sel"] forState:UIControlStateSelected];
    [_checkboxPassword addTarget:self action:@selector(isSelectCheckbox:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [_checkboxAutologin setImage:[UIImage imageNamed:@"unsel"] forState:UIControlStateNormal];
    [_checkboxAutologin setImage:[UIImage imageNamed:@"sel"] forState:UIControlStateSelected];
    [_checkboxAutologin addTarget:self action:@selector(isSelectCheckbox:) forControlEvents:UIControlEventTouchUpInside];
    
//    /* 代码方式添加复选框 */
//    UIButton *checkbox = [UIButton buttonWithType:UIButtonTypeCustom];
//    CGRect checkboxRect = CGRectMake(10,150,36,36);
//    [checkbox setFrame:checkboxRect];
//    [checkbox setImage:[UIImage imageNamed:@"cbox0"] forState:UIControlStateNormal];
//    [checkbox setImage:[UIImage imageNamed:@"cbox1"] forState:UIControlStateSelected];
//    [checkbox addTarget:self action:@selector(isSelectCheckbox:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:checkbox];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)login:(id)sender
{
    NSString *user = _username.text;
    NSString *pwds = _password.text;
    NSLog(@"登陆 user[%@] %@]", user, pwds);
}

- (IBAction)regist:(id)sender
{
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController * registViewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"registViewController"];
    
    registViewController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:registViewController animated:YES completion:^{NSLog(@"进入注册页面");}];
}



- (void)isSelectCheckbox:(UIButton*)btn
{
    btn.selected = !btn.selected;
}

- (void)kbExit:(id)sender
{
    [self.view endEditing:YES];
}


#pragma mark - 点击Return自动转到下个文本框
- (IBAction)kbUserTextField:(id)sender {
    [self.password becomeFirstResponder];
}

- (IBAction)kbPwdsTextField:(id)sender {
    [self.loginBtn sendActionsForControlEvents:UIControlEventTouchUpInside];
}

@end
