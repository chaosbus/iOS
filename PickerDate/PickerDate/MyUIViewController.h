//
//  MyUIViewController.h
//  PickerDate
//
//  Created by Joe on 14-7-18.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyUIViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIDatePicker *pickerDateView;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerProvinceView;

- (IBAction)clickDate:(id)sender;
- (IBAction)clickProv:(id)sender;

@end
