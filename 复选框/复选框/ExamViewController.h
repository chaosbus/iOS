//
//  ExamViewController.h
//  复选框
//
//  Created by Joe on 14-8-12.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExamViewController : UIViewController

@property (nonatomic, weak) IBOutlet UIButton *checkbox1;

- (IBAction)cb1click:(UIButton *)btn;
@end
