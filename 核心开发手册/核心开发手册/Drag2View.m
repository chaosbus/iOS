//
//  Drag2View.m
//  核心开发手册
//
//  Created by Joe on 14/10/21.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "Drag2View.h"

@implementation Drag2View
{
    CGFloat theta;
    CGFloat scale;
    CGFloat tx;
    CGFloat ty;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithImage:(UIImage *)image
{
    if (self = [super initWithImage:image]) {
        self.userInteractionEnabled = YES;
        
        self.transform = CGAffineTransformIdentity;
        tx = ty = theta = 0.0f;
        scale = 1.0f;
        
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
        UIPinchGestureRecognizer *pin = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinch:)];
        UIRotationGestureRecognizer *rot = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(handleRotation:)];
        // 单击
        UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap1:)];
        tap1.numberOfTapsRequired = 1;
        // 双击
        UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap2:)];
        tap2.numberOfTapsRequired = 2;
        
        // 双击监控失败时才会响应单击事件
        [tap1 requireGestureRecognizerToFail:tap2];
        
        self.gestureRecognizers = @[pan, pin, rot, tap1, tap2];
        
        for (UIGestureRecognizer *gesture in self.gestureRecognizers) {
            gesture.delegate = self;
        }
    } else
        return nil;
    
    
    return self;
}


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

// 平移
- (void)handlePan:(UIPanGestureRecognizer*)uigr
{
    CGPoint translation = [uigr translationInView:self.superview];
    CGPoint loc = [uigr locationInView:self.superview];
    NSLog(@"location: %.2f, %.2f", loc.x, loc.y);
    [self updateTransformWithOffset:translation];

}

// 缩放
- (void)handlePinch:(UIPinchGestureRecognizer*)uigr
{
    scale = uigr.scale;
    [self updateTransformWithOffset:CGPointZero];
}

// 旋转
- (void)handleRotation:(UIRotationGestureRecognizer*)uigr
{
    theta = uigr.rotation;
    [self updateTransformWithOffset:CGPointZero];
}

// 单击
- (void)handleTap1:(UITapGestureRecognizer*)uigr
{
    NSLog(@"TAP 1 :: %lu,  %lu", (unsigned long)uigr.numberOfTapsRequired, (unsigned long)uigr.numberOfTouchesRequired);
}

// 双击
- (void)handleTap2:(UITapGestureRecognizer*)uigr
{
    NSLog(@"TAP 2 :: %lu,  %lu", (unsigned long)uigr.numberOfTapsRequired, (unsigned long)uigr.numberOfTouchesRequired);
}

- (void)updateTransformWithOffset:(CGPoint)translation
{
    self.transform = CGAffineTransformMakeTranslation(translation.x +tx, translation.y + ty);
    self.transform = CGAffineTransformRotate(self.transform, theta);
    self.transform = CGAffineTransformScale(self.transform, scale, scale);
    NSLog(@"trans[%.2f, %.2f]  xy[%.2f, %.2f]  ø[%.2f]  scale[%.2f]", translation.x, translation.y, self.transform.tx, self.transform.ty, theta, scale);
    
}

@end
