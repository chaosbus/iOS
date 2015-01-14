//
//  RectViewController.m
//  核心开发手册
//
//  Created by Joe on 14-10-11.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "RectViewController.h"

@interface RectViewController ()

@end

@implementation RectViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    [self myview4];
}

- (void)loadView
{
    [super loadView];
    self.view.backgroundColor = [UIColor whiteColor];
//    [self myview4];
    [self myview2];
    [self herit];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self myview];
//    [self myview2];
//    [self myview3];
//    [self myview4];

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

#define INSET_AMT   1.5f
- (void)myview
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    CGRect myRec = CGRectMake(100, 80, 160, 200);
    UIView *myView = [[UIView alloc] initWithFrame:myRec];
    myView.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:myView];

    // 偏移
    CGRect myRecOffset = CGRectOffset(myRec, 30, 50);
    UIView *myViewOffset = [[UIView alloc] initWithFrame:myRecOffset];
    myViewOffset.backgroundColor = [UIColor purpleColor];
    
//    [self.view addSubview:myViewOffset];
//    [self.view insertSubview:myViewOffset atIndex:0];
    [self.view insertSubview:myViewOffset belowSubview:myView];
    
    // 以中心缩放
    CGRect mr1 = CGRectInset(myRec, 4.0f * INSET_AMT, 4.0f * INSET_AMT);
    UIView *mv1 = [[UIView alloc] initWithFrame:mr1];
    mv1.backgroundColor = [UIColor redColor];
    [self.view addSubview:mv1];

    CGRect mr2 = CGRectInset(myRec, 10.0f * INSET_AMT, 10.0f * INSET_AMT);
    UIView *mv2 = [[UIView alloc] initWithFrame:mr2];
    mv2.backgroundColor = [UIColor greenColor];
    [self.view addSubview:mv2];
}

- (void)myview2
{
    CGRect rect = CGRectMake(0, 0, 200, 180);
    UIView *myview = [[UIView alloc] initWithFrame:rect];
    myview.backgroundColor = [UIColor cyanColor];
    myview.center = CGPointMake(180, 480);
    CGRect myRec = myview.frame;

    [self.view addSubview:myview];
    
    // 以中心缩放
    CGRect mr1 = CGRectInset(rect, 10.0f * INSET_AMT, 10.0f * INSET_AMT);
    UIView *mv1 = [[UIView alloc] initWithFrame:mr1];
    mv1.backgroundColor = [UIColor redColor];
    [myview addSubview:mv1];
    
    
    NSString *s1 = NSStringFromCGRect(myRec);
    CGRect rect1 = CGRectFromString(s1);
    if (CGRectEqualToRect(myRec, rect1)) {
        NSLog(@"yes == ");
    }

    CGPoint midPoint = CGPointMake(CGRectGetMidX(myRec), CGRectGetMidY(myRec));
    UILabel *midLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
    midLable.center = midPoint;
    midLable.text = @"myView2";
    midLable.textAlignment = NSTextAlignmentCenter;
//    midLable.backgroundColor = [UIColor blueColor];
    [self.view addSubview:midLable];
    
    myview.layer.shadowPath = [UIBezierPath bezierPathWithRect:myview.bounds].CGPath;

    
    CGRect rt1 = myRec;
    rt1.size.width = 110;
    myview.frame = rt1;
//    myview.clipsToBounds = YES;
    self.view.autoresizesSubviews = YES;
}

- (void)myview3
{
    CGRect dest = CGRectMake(100.0f, 400.0f, 100.0f, 100.0f);
    
    UIView *compareView = [[UIView alloc] initWithFrame:dest];
    compareView.backgroundColor = [UIColor redColor];
    [self.view addSubview:compareView];
    
    UIView *testView = [[UIView alloc] initWithFrame:dest];
    testView.backgroundColor = [[UIColor greenColor] colorWithAlphaComponent:0.5f];
    [self.view addSubview:testView];
    
    CGAffineTransform transform = CGAffineTransformIdentity;
    transform = CGAffineTransformRotate(transform, M_PI_4);
    transform = CGAffineTransformScale(transform, 1.5f, 0.75f*2);
    transform = CGAffineTransformTranslate(transform, 30.0f, 40.0f);
    testView.transform = transform;

    compareView.transform = CGAffineTransformMakeTranslation(0.8f, 0.8f);
    
    [UIView animateWithDuration:2.0f animations:^{
        compareView.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [compareView removeFromSuperview];
    }];
}


- (void)myview4
{
    self.view.backgroundColor = [UIColor whiteColor];

    UIView *maskView = [[UIView alloc] initWithFrame:self.view.frame];
    maskView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:maskView];
    
    CGRect r1 = self.view.frame;
    r1.size.height -= 50;
    r1.size.width -= 50;
    UIView *midView = [[UIView alloc] initWithFrame:r1];
    midView.backgroundColor = [[UIColor greenColor] colorWithAlphaComponent:0.5f];
    midView.center = maskView.center;
    [maskView addSubview:midView];
    
    
    UILabel *t = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
    t.textAlignment = NSTextAlignmentCenter;
    t.text = @"Begin";
    t.center = midView.center;
    [maskView addSubview:t];
    
//    maskView.transform = CGAffineTransformMakeScale(0.7f, 0.7f);
    
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView animateWithDuration:2.0f animations:^{
        maskView.transform = CGAffineTransformMakeScale(0.7f, 0.7f);
    } completion:^(BOOL finished) {
        [midView removeFromSuperview];
        t.text = @"end";
    }];
}

- (void)herit
{
    UINavigationController *nav1 = [[UINavigationController alloc] init];
    UINavigationController *nav2 = [[UINavigationController alloc] init];
    [nav1 addChildViewController:nav2];

    if (nav2.view.superview == nav1.view) {
        NSLog(@"nav2.superview = nav1.view");
    } else {
        NSLog(@"nav2 != nav1");
    }
}

@end
