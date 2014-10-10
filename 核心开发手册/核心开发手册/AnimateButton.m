//
//  AnimateButton.m
//  核心开发手册
//
//  Created by Joe on 14-9-26.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "AnimateButton.h"

#define CAPWIDTH    110.0f
#define INSETS      (UIEdgeInsets){0.0f, CAPWIDTH, 0.0f, CAPWIDTH}
#define BASEGREEN   [[UIImage imageNamed:@"green-out.png"] resizableImageWithCapInsets:INSETS]
#define PUSHGREEN   [[UIImage imageNamed:@"green-in.png"] resizableImageWithCapInsets:INSETS]
#define BASERED     [[UIImage imageNamed:@"red-out.png"] resizableImageWithCapInsets:INSETS]
#define PUSHRED     [[UIImage imageNamed:@"red-in.png"] resizableImageWithCapInsets:INSETS]

@implementation AnimateButton
//@synthesize isOn = _isOn;

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)toggleButton:(UIButton *)button
{
    if ((_isOn = !_isOn)) {
        [self setBackgroundImage:BASEGREEN forState:UIControlStateNormal];
        [self setBackgroundImage:PUSHGREEN forState:UIControlStateHighlighted];
        [self setTitle:@"开" forState:UIControlStateNormal];
        [self setTitle:@"准备开" forState:UIControlStateHighlighted];
    } else {
        [self setBackgroundImage:BASERED forState:UIControlStateNormal];
        [self setBackgroundImage:PUSHRED forState:UIControlStateHighlighted];
        [self setTitle:@"关" forState:UIControlStateNormal];
        [self setTitle:@"准备关" forState:UIControlStateHighlighted];
    }
    
}

- (void)zoomButton:(UIButton *)AnimateButton
{
    [UIView animateWithDuration:0.2f animations:^{
        self.transform = CGAffineTransformMakeScale(1.1f, 1.1f);
    }];
}

- (void)relaxButton:(UIButton *)AnimateButton
{
    [UIView animateWithDuration:0.2f animations:^{
        self.transform = CGAffineTransformIdentity;
    }];
}

+ (AnimateButton *)initButton
{
    AnimateButton *btn = [AnimateButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0.0f, 0.0f, 220.0f, 233.0f);
    
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    btn.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    btn.titleLabel.font = [UIFont boldSystemFontOfSize:30.0f];
    
    // 设置背影图
    [btn setBackgroundImage:BASEGREEN forState:UIControlStateNormal];
    [btn setBackgroundImage:PUSHGREEN forState:UIControlStateHighlighted];
    [btn setTitle:@"开" forState:UIControlStateNormal];
    [btn setTitle:@"准备开" forState:UIControlStateHighlighted];

    btn.isOn = YES;

    
    [btn addTarget:btn action:@selector(toggleButton:) forControlEvents:UIControlEventTouchUpInside];
    [btn addTarget:btn action:@selector(zoomButton:) forControlEvents:UIControlEventTouchDown | UIControlEventTouchDragInside | UIControlEventTouchDragEnter];
    [btn addTarget:btn action:@selector(relaxButton:) forControlEvents:UIControlEventTouchDragExit | UIControlEventTouchCancel | UIControlEventTouchDragOutside | UIControlEventTouchUpInside];
    
    
    return btn;
}



@end
