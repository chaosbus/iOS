//
//  viewViewController.h
//  scroll
//
//  Created by Joe on 14-9-5.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "touchScrollView.h"

@interface viewViewController : UIViewController <UIScrollViewAccessibilityDelegate, UIScrollViewDelegate>
//@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic) IBOutlet touchScrollView *scrollView;

@end
