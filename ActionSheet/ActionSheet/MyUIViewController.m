//
//  MyUIViewController.m
//  ActionSheet
//
//  Created by Joe on 14-7-17.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "MyUIViewController.h"

@interface MyUIViewController ()

@end

@implementation MyUIViewController

- (void)viewDidLoad
{
    NSLog(@"didload");
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





- (IBAction)testAlertView:(id)sender
{
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:@"Alert Title"
                              message:@"hahaha~~"
                              delegate:nil //self
                              cancelButtonTitle:@"Cancel"
                              otherButtonTitles:@"Other", /*@"Other1", @"Other2",*/ nil];
    
#if 0
    /* 这里添加了2个文档框 */
    [alertView setAlertViewStyle:UIAlertViewStyleLoginAndPasswordInput];
    [alertView setAlertViewStyle:UIAlertViewStylePlainTextInput];
    [alertView setAlertViewStyle:UIAlertViewStyleSecureTextInput];

    UITextField * text1 = [alertView textFieldAtIndex:0];
    UITextField * text2 = [alertView textFieldAtIndex:1];
    text1.keyboardType = UIKeyboardTypeNumberPad;
    text2.keyboardType = UIKeyboardTypeNumbersAndPunctuation;

    [alertView addButtonWithTitle:@"new"];
#endif

    [alertView show];
}


#pragma mark--
- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"alertView:buttonIndex = %i", buttonIndex);
    
#if 0
    /* 获取输入内容 */
    UITextField *tf0 = [alertView textFieldAtIndex:0];
    UITextField *tf1 = [alertView textFieldAtIndex:1];
    NSLog(@"Plaint[%@] Password[%@]", tf0.text, tf1.text);
#endif
}

- (IBAction)testActionSheet:(id)sender
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:@"标题"
                                  delegate:self
                                  cancelButtonTitle:@"取消"
                                  destructiveButtonTitle:@"破坏按键"
                                  otherButtonTitles:@"Facebook", @"新浪微博", @"Instagram", nil];
    
    actionSheet.actionSheetStyle = UIActionSheetStyleAutomatic;
    [actionSheet showInView:self.view];
}


- (void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        [self showAlert:@"破坏按键"];
    }else if (buttonIndex == 1) {
        [self showAlert:@"Facebook"];
    }else if(buttonIndex == 2) {
        [self showAlert:@"新浪微博"];
    }else if(buttonIndex == 3) {
        [self showAlert:@"Instagram"];
    }else if(buttonIndex == 4) {
        [self showAlert:@"取消"];
    }
    NSLog(@"buttonIndex = %i", buttonIndex);
}



- (void)showAlert:(NSString *)msg {
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Action Sheet选择项"
                          message:msg
                          delegate:self
                          cancelButtonTitle:@"确定"
                          otherButtonTitles: nil];
    [alert show];
}

@end
