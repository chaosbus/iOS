//
//  AnimateButton.h
//  核心开发手册
//
//  Created by Joe on 14-9-26.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimateButton : UIButton
{
    BOOL isOn;
}

@property (nonatomic, assign) BOOL isOn;
+ (AnimateButton *)initButton;

@end
