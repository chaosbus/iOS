//
//  AlertViewController.m
//  核心开发手册
//
//  Created by Joe on 14-10-11.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "AlertViewController.h"

@interface AlertViewController ()

@end

@implementation AlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self  test];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)test
{
    self.view.backgroundColor = [UIColor blackColor];
    UIActivityIndicatorView *aiv = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    aiv.center = CGPointMake(self.view.center.x, self.view.center.y);
    aiv.backgroundColor = [UIColor redColor];
    aiv.color = [UIColor blueColor];
    [self.view addSubview:aiv];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSInteger tag = alertView.tag;
    NSLog(@"#click tag[%ld] selection[%ld]", (long)tag, (long)buttonIndex);

    if (1 == tag) {
        NSLog(@"");
    } else if (2 == tag) {
        NSLog(@"%@, %@", [alertView textFieldAtIndex:0].text,
              [alertView textFieldAtIndex:0].text);
    }
}

- (void)showAlert1:(NSString *)title andMessage:(NSString *)message
{
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"1", @"2", @"3", nil];
    av.tag = 1;
    av.alertViewStyle = UIAlertViewStyleDefault;
    av.backgroundColor = [UIColor redColor];
    av.tintColor = [UIColor greenColor];
    
    [av show];
}

- (void)showAlert2:(NSString *)title andMessage:(NSString *)message
{
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    av.tag = 2;
    av.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;

    [av show];
}

- (void)showAlert3:(NSString *)title andMessage:(NSString *)message
{
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    av.tag = 3;
    av.alertViewStyle = UIAlertViewStylePlainTextInput;
    
    [av show];
}

- (void)showAlert4:(NSString *)title andMessage:(NSString *)message
{
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    av.tag = 4;
    av.alertViewStyle = UIAlertViewStyleSecureTextInput;
    
    [av show];
}

- (void)showAlert5:(NSString *)title andMessage:(NSString *)message
{
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    av.tag = 5;
    
    UIActivityIndicatorView *aiv = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    aiv.backgroundColor = [UIColor redColor];
    aiv.color = [UIColor blackColor];
    aiv.center = CGPointMake(av.center.x, av.center.y);
    [aiv startAnimating];
    
    [av addSubview:aiv];
    
    [av show];
}


- (IBAction)alert1:(id)sender
{
    [self showAlert1:@"标题要长1" andMessage:@"小标题"];
}

- (IBAction)alert2:(id)sender
{
    [self showAlert2:@"标题要长2" andMessage:@"小标题"];
}

- (IBAction)alert3:(id)sender
{
    [self showAlert3:@"标题要长3" andMessage:@"小标题"];
}

- (IBAction)alert4:(id)sender
{
    [self showAlert4:@"标题要长4" andMessage:@"小标题"];
}

- (IBAction)alert5:(id)sender
{
    [self showAlert5:@"指示器" andMessage:@"小标题\n\n\n"];
}

- (IBAction)alert6:(id)sender
{
    
}
@end
