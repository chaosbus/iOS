//
//  DatePickerView.h
//  HotelBooking
//
//  Created by Joe on 15/1/9.
//  Copyright (c) 2015年 Joe. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol DatePickerViewDelegate <NSObject>

@required
- (void)setDatPickerViewToolBarButton;
//- (void)clickDateEnter;
//- (void)clickDateCancel;

@end


@interface DatePickerView : UIView

@property (nonatomic) UIDatePicker *datePicker;
@property (nonatomic) UIToolbar *toolBar;
//@property (nonatomic) NSMutableArray *toolBarItems;
@property (nonatomic) NSDate *selectedDate;

@property (nonatomic) id<DatePickerViewDelegate> dpvDelegate;

- (void)setDatePickerView;
- (void)clickDateEnter;
- (void)clickDateCancel;

@end
