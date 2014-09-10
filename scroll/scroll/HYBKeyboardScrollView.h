//
//  HYBKeyboardScrollView.h
//  HomeLinkProject
//
//  Created by huangyibiao on 14-6-3.
//  Copyright (c) 2014年 huangyibiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HYBKeyboardScrollViewDelegate <NSObject>

- (void)keyboardWillHide;

@end

/*!
 * @brief 继承于UIScrollView,添加解决键盘自动隐藏的功能
 * @author huangyibiao
 */
@interface HYBKeyboardScrollView : UIScrollView

// 键盘将要键盘的代理
@property (nonatomic, weak) id<HYBKeyboardScrollViewDelegate> keyboardHideDelegate;

@end