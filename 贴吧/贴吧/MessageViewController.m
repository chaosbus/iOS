//
//  MessageViewController.m
//  贴吧
//
//  Created by Joe on 14-9-10.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "MessageViewController.h"
#import "MessageToMeView.h"
#import "AtMeView.h"
#import "RespondMeView.h"

@interface MessageViewController ()

@end

@implementation MessageViewController

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
    if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0)) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    self.navigationItem.title = @"消息";
    
    [self addBarButtonItem];
    [self addSegmentedControlInNavigationItem];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma makr - 添加导航左右键
- (void)addBarButtonItem
{
    UIBarButtonItem *addChatBtn = [[UIBarButtonItem alloc]
                                 initWithTitle:@"添加新的聊天"
                                 style:UIBarButtonItemStyleBordered
                                 target:self
                                 action:nil];
    self.navigationItem.rightBarButtonItem = addChatBtn;
}

#pragma mark - 在导航栏添加段控制器，控制3个View的切换
- (void)addSegmentedControlInNavigationItem
{
    self.navigationItem.title = @"";

    CGRect segCtrlFrame = CGRectMake(0, 10, 150, 25);
    segCtrlFrame.origin.x = ([UIScreen mainScreen].applicationFrame.size.width - segCtrlFrame.size.width) / 2.0;
    UISegmentedControl *msgSegCtrl = [[UISegmentedControl alloc] initWithFrame:segCtrlFrame];
    [msgSegCtrl insertSegmentWithTitle:@"消息" atIndex:0 animated:YES];
    [msgSegCtrl insertSegmentWithTitle:@"回复" atIndex:1 animated:YES];
    [msgSegCtrl insertSegmentWithTitle:@"@我" atIndex:2 animated:YES];
    
    
    
    /*
     * 下面的代码实同正常状态和按下状态的属性控制,比如字体的大小和颜色等
     */
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:12], NSFontAttributeName, [UIColor whiteColor], NSForegroundColorAttributeName, nil];
    [msgSegCtrl setTitleTextAttributes:attributes forState:UIControlStateNormal];
    
//    NSDictionary *highlightedAttributes = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    NSDictionary *highlightedAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor yellowColor], NSForegroundColorAttributeName, nil];

    [msgSegCtrl setTitleTextAttributes:highlightedAttributes forState:UIControlStateHighlighted];
    
    // TintColor
    msgSegCtrl.tintColor = [UIColor colorWithRed:(51.0/255.0) green:(153.0/255.0) blue:(204.0/255.0) alpha:1.0];
//	msgSegCtrl.segmentedControlStyle = UISegmentedControlStyleBar;
    // 默认选中项
	msgSegCtrl.selectedSegmentIndex = 0;
    
    //设置分段控件点击相应事件
    [msgSegCtrl addTarget:self action:@selector(showSegmentedView:) forControlEvents:UIControlEventValueChanged];

    [self.navigationController.navigationBar addSubview:msgSegCtrl];
    
}

#pragma mark - 段控制器按键处理事件
- (void)showSegmentedView:(UISegmentedControl *)seg
{
    MessageToMeView *view0;
    RespondMeView *view1;
    AtMeView *view2;

    switch (seg.selectedSegmentIndex) {
        case 0:
            // 添加子视图
            view0 = [[MessageToMeView alloc] init];
            [self.view.superview addSubview:view0.view];
            [self.view removeFromSuperview];
            break;
        case 1:
            view1 = [[RespondMeView alloc] init];
            [self.view.superview addSubview:view1.view];
            [self.view removeFromSuperview];
            break;
        case 2:
            view2 = [[AtMeView alloc] init];
            [self.view.superview addSubview:view2.view];
            [self.view removeFromSuperview];
            break;
        default:
            NSLog(@"unexpected SegmentIndex : %i", seg.selectedSegmentIndex);
            break;
    }
    
    NSLog(@"SegmentIndex : %i", seg.selectedSegmentIndex);
}

@end
