//
//  DatePickerView.h
//  HotelBooking
//
//  Created by Joe on 15/1/9.
//  Copyright (c) 2015年 Joe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DatePickerView : UIView

@property (nonatomic) UIDatePicker *datePicker;
@property (nonatomic) UIToolbar *toolBar;
@property (nonatomic) NSMutableArray *toolBarItems;
@property (nonatomic) NSDate *selectedDate;
- (void)selecteDateOkay;
- (void)awakeFromNib;
@end

@protocol DatePickerViewProtocol <NSObject>

@end