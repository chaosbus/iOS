//
//  EZSliderViewController.m
//  EZSliderViewController
//
//  Created by Joe on 14/10/24.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "EZSideViewController.h"

/* 移动方向 */
#define MOVE_TO_LEFT    true
#define MOVE_TO_RIGHT   false

#define MARGIN_WIDTH    200 // SliderView显示的宽度(默认)


@interface EZSideViewController () <UIGestureRecognizerDelegate>
{
    UIView *_baseView;  // EZSliderViewController.view
    UIView *_topView;   // 最上一层
    
    UIPanGestureRecognizer *_panGestureRecognizer;
    BOOL _moveDirection;
    
    UIButton *_maskButton;
}
@end

@implementation EZSideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _baseView = self.view;
    [_baseView setBackgroundColor:[UIColor colorWithRed:0.5 green:0.6 blue:0.8 alpha:1]];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (!self.rootVC) {
        NSAssert(false, @"you must set rootViewController!!");
    }

    if (_topView != _rootVC.view) {
        if (_topView)
            [_topView removeFromSuperview];
        _topView = _rootVC.view;
        [_baseView addSubview:_topView];
        _topView.frame=_baseView.bounds;
    }
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


- (instancetype)init
{
    return [self initWithNibName:nil bundle:nil];
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _baseView = self.view;

        _leftMargin = MARGIN_WIDTH;
        _rightMargin = MARGIN_WIDTH;
        
        _needShadow = true;
        _needScale = true;
        
        _panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
        [_panGestureRecognizer setDelegate:self];
        [_baseView addGestureRecognizer:_panGestureRecognizer];
        
        _maskButton = [[UIButton alloc] initWithFrame:self.view.frame];
        [_maskButton addTarget:self action:@selector(hideSliderViewController) forControlEvents:UIControlEventTouchUpInside];
//        [_maskButton setBackgroundColor:[UIColor colorWithWhite:0.5f alpha:0.5f]];
        
        
        self.view.backgroundColor = [UIColor yellowColor];
    }
    
    return self;
}

#pragma mark - UIGestureDelegate

/**
 * 平移拖动显示边栏
 */
- (void)pan:(UIPanGestureRecognizer *)uigr
{
    CGPoint translation = [uigr translationInView:self.view.superview];
    NSLog(@"%s\t[%.0f, %.0f]", __func__, translation.x, translation.y);
    
    if (translation.x > 0) {
//        [self showLeftViewController:true];
    } else if (translation.x < 0) {
//        [self showRightViewController:true];
    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer == _panGestureRecognizer) {
        CGPoint translation = [_panGestureRecognizer translationInView:_baseView];
        // 每秒移动的点数
        CGPoint velTranslation = [_panGestureRecognizer velocityInView:_baseView];
        
        CGPoint currPosition = [_panGestureRecognizer locationInView:_baseView];
        NSLog(@"%s\t[%.2f, %.2f]\t[%.0f, %.0f]\t[%.0f, %.0f]", __func__, translation.x, translation.y, velTranslation.x, velTranslation.y, currPosition.x, currPosition.y);
        
        //
        if (velTranslation.x < 600 && ABS(translation.x)/ABS(translation.y) > 1) {
            return YES;
        }
        return NO;
    }
    
    return YES;
}

//- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
//    // Check for horizontal pan gesture
//    if (gestureRecognizer == _panGestureRecognizer) {
//        UIPanGestureRecognizer *panGesture = (UIPanGestureRecognizer*)gestureRecognizer;
//        CGPoint translation = [panGesture translationInView:_baseView];
//        if ([panGesture velocityInView:_baseView].x < 600 && ABS(translation.x)/ABS(translation.y)>1) {
//            return YES;
//        }
//        return NO;
//    }
//    return YES;
//}

#pragma mark - Show or Hide ViewControllers
/**
 * 点击时隐藏SliderViewController
 */
- (void)hideSliderViewController
{
    [self hideSliderViewController:true];
    NSLog(@"%s", __func__);
}

/**
 * 隐藏边栏
 */
- (void)hideSliderViewController:(BOOL)animated
{
    NSTimeInterval t = 0.3f;
    [UIView animateWithDuration:t animations:^{
        [self layoutTopView:0.0f];
//        [_maskButton setBackgroundColor:[UIColor clearColor]];
    } completion:^(BOOL finished) {
        [_maskButton removeFromSuperview];
        [_leftVC.view removeFromSuperview];
        [_rightVC.view removeFromSuperview];
    }];
}

/**
 * 显示左栏
 */
- (void)showLeftViewController:(BOOL)animated
{
    [self willShowLeftViewController];
    NSTimeInterval t = 0.3f;
    [UIView animateWithDuration:t animations:^{
        [_topView addSubview:_maskButton];
        [self layoutTopView:_leftMargin];
        [self showShadow:_needShadow];
    }];
}

/**
 * 显示右栏
 */
- (void)showRightViewController:(BOOL)animated
{
    [self willShowRightViewController];
    NSTimeInterval t = 0.3f;
    [UIView animateWithDuration:t animations:^{
        [_topView addSubview:_maskButton];
        [self layoutTopView:-_rightMargin];
        [self showShadow:_needShadow];
    }];
}

- (void)willShowLeftViewController
{
    _leftVC.view.frame = _baseView.bounds;
    // topView显示在leftView之上
    [_baseView insertSubview:_leftVC.view belowSubview:_topView];
}

- (void)willShowRightViewController
{
    _rightVC.view.frame = _baseView.bounds;
    [_baseView insertSubview:_rightVC.view belowSubview:_topView];
}

/**
 * 设置TopView
 */
- (void)layoutTopView:(CGFloat)offset
{
    if (0.0f == offset) {
        _topView.transform = CGAffineTransformIdentity;
        _topView.frame = _baseView.frame;
    } else {
        CGPoint center = _topView.center;
        center.x += offset;
        _topView.center = center;
        
        if (_needScale) {
            CGFloat scale = 0.7;
            _topView.transform = CGAffineTransformMakeScale(scale, scale);
        }
    }
}

/**
 * 显示边框阴影
 */
- (void)showShadow:(BOOL)isShow
{
    _topView.layer.shadowOpacity    = isShow ? 0.8f : 0.0f;
    if (isShow) {
        _topView.layer.cornerRadius = 4.0f;
        _topView.layer.shadowOffset = CGSizeZero;
        _topView.layer.shadowRadius = 4.0f;
        _topView.layer.shadowPath   = [UIBezierPath bezierPathWithRect:_topView.bounds].CGPath;
    }
}

#pragma mark - setValue below

- (void)setRootVC:(UIViewController *)rootVC
{
    if (rootVC != _rootVC) {
        if (_rootVC) {
            [_rootVC removeFromParentViewController];
        }
        
        _rootVC = rootVC;
        if (_rootVC) {
            [self addChildViewController:_rootVC];
        }
    }
}

- (void)setLeftVC:(UIViewController *)leftVC
{
    if (leftVC != _leftVC) {
        if (_leftVC) {
            [_leftVC removeFromParentViewController];
        }
        
        _leftVC = leftVC;
        if (_leftVC) {
            [self addChildViewController:_leftVC];
        }
    }
}

- (void)setRightVC:(UIViewController *)rightVC
{
    if (rightVC != _rightVC) {
        if (_rightVC) {
            [_rightVC removeFromParentViewController];
        }
        
        _rightVC = rightVC;
        if (_rightVC) {
            [self addChildViewController:_rightVC];
        }
    }
}

- (void)setLeftMargin:(CGFloat)leftMargin
{
    _leftMargin = leftMargin;
}

- (void)setRightMargin:(CGFloat)rightMargin
{
    _rightMargin = rightMargin;
}

@end
