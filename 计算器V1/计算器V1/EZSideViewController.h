//
//  EZSliderViewController.h
//  EZSliderViewController
//
//  Created by Joe on 14/10/24.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EZSideViewController : UIViewController

@property (nonatomic, retain) UIViewController *leftVC;     // 左控制器
@property (nonatomic, retain) UIViewController *rightVC;    // 右控制器
@property (nonatomic, retain) UIViewController *rootVC;     // 主控制器

@property (nonatomic, assign) CGFloat leftMargin;   // 右滑后左边留出空白宽度
@property (nonatomic, assign) CGFloat rightMargin;  // 左滑后右边留出空白宽度


// Options
@property (nonatomic, assign) BOOL needScale;   // 是否支持缩放
@property (nonatomic, assign) BOOL needShadow;  // 是否需要阴影



- (void)showLeftViewController:(BOOL)animated;
- (void)showRightViewController:(BOOL)animated;
- (void)hideSliderViewController:(BOOL)animated;




@end
