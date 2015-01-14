//
//  KeyboardViewController.m
//  核心开发手册
//
//  Created by Joe on 14-10-15.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "KeyboardViewController.h"

#define BARBUTTON(TITLE, SELECTOR) [[UIBarButtonItem alloc] initWithTitle:TITLE style:UIBarButtonItemStylePlain target:self action:SELECTOR]
#define SYSBARBUTTON(ITEM, SELECTOR) [[UIBarButtonItem alloc] initWithBarButtonSystemItem:ITEM target:self action:SELECTOR]
#define BARBUTTON_WITH_IMAGE(imagename, selector)   [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:imagename] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:selector]

@interface KeyboardViewController ()
{
    UITextView *textView;
    UIToolbar *toolBar;
}
@end

@implementation KeyboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self myview];
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

- (void)myview
{
    textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 100, 200, 400)];
//    textView.backgroundColor = [UIColor cyanColor];
    textView.inputAccessoryView = [self accessoryViewwww];
    textView.text = @"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.";
    
    NSMutableArray *items = [NSMutableArray array];
    [items addObject:BARBUTTON(@"Clear", @selector(clearText))];
    [items addObject:SYSBARBUTTON(UIBarButtonSystemItemFlexibleSpace, nil)];
    [items addObject:BARBUTTON_WITH_IMAGE(@"ToolViewEmotion_ios7@2x", @selector(clearText))];
    [items addObject:SYSBARBUTTON(UIBarButtonSystemItemFlexibleSpace, nil)];
    [items addObject:BARBUTTON_WITH_IMAGE(@"ToolViewInputVoice_ios7@2x", @selector(clearText))];
    [items addObject:SYSBARBUTTON(UIBarButtonSystemItemFlexibleSpace, nil)];
//    [items addObject:BARBUTTON_WITH_IMAGE(@"ToolViewKeyboard_ios7@2x", @selector(clearText))];
//    [items addObject:SYSBARBUTTON(UIBarButtonSystemItemFlexibleSpace, nil)];
//    [items addObject:BARBUTTON_WITH_IMAGE(@"TypeSelectorBtn_Black_ios7@2x", @selector(clearText))];
//    [items addObject:SYSBARBUTTON(UIBarButtonSystemItemFlexibleSpace, nil)];
    [items addObject:BARBUTTON(@"Done", @selector(leaveKeyboardMode))];
    toolBar.items = items;
    
    UIView *bg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 210, 410)];
    bg.center = textView.center;
    bg.backgroundColor = [UIColor darkGrayColor];
    
    [self.view addSubview:bg];
    [self.view addSubview:textView];
}

- (UIToolbar *)accessoryViewwww
{
    toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44.0f)];
    toolBar.tintColor = [UIColor redColor];
    
    return toolBar;
}

- (void)clearText
{
    textView.text = @"";
}

- (void)leaveKeyboardMode
{
    [textView resignFirstResponder];
}

- (void)keyboardDidShow
{
    
}
@end
