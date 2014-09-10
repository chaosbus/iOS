//
//  PrefixViewController.h
//  SigleViewTsst
//
//  Created by Joe on 14-8-21.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PrefixViewController : UIViewController



@property (weak, nonatomic) IBOutlet UILabel *label1;

@property (weak, nonatomic) IBOutlet UIButton *btn1;

@property (weak, nonatomic) IBOutlet UIButton * btn2;
@property (weak, nonatomic) IBOutlet UITextField *inputText;

- (IBAction)btn2Act:(id)sender;
@end
