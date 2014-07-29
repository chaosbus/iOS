//
//  MyUIViewController.h
//  PickerProvince
//
//  Created by Joe on 14-7-18.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyUIViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>


@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UILabel *label;

@property (nonatomic, strong) NSDictionary *pickerData;
@property (nonatomic, strong) NSArray * pickerProvincesData;
@property (nonatomic, strong) NSArray *pickerCitiesData;

- (IBAction)onclick:(id)sender;

@end
