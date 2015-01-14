//
//  DatePickerView.m
//  HotelBooking
//
//  Created by Joe on 15/1/9.
//  Copyright (c) 2015年 Joe. All rights reserved.
//

#import "DatePickerView.h"
//#import "Macro.h"

#define HEIGHT_DATEPICKER   216.0f
#define HEIGHT_TOOLBAR      44.0f
#define WIDTH_VIEW          [UIScreen mainScreen ].applicationFrame.size.width
#define HEIGHT_VIEW          [UIScreen mainScreen ].applicationFrame.size.height

@implementation DatePickerView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init {
    self = [super init];
    if (nil == self) {
        self = [self initWithFrame:CGRectMake(0, HEIGHT_VIEW - (HEIGHT_DATEPICKER + HEIGHT_TOOLBAR), WIDTH_VIEW, HEIGHT_DATEPICKER + HEIGHT_TOOLBAR)];
    }
    
    self.frame = CGRectMake(0, HEIGHT_VIEW - (HEIGHT_DATEPICKER + HEIGHT_TOOLBAR), WIDTH_VIEW, HEIGHT_DATEPICKER + HEIGHT_TOOLBAR);
    self.backgroundColor = [UIColor grayColor];

    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor yellowColor];

    return self;
}

- (void)setDatePickerView {
//    self.frame = CGRectMake(0, 300, WIDTH_VIEW, HEIGHT_TOOLBAR + HEIGHT_TOOLBAR);
//    self.backgroundColor = [UIColor brownColor];

    self.toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, WIDTH_VIEW, HEIGHT_TOOLBAR)];
//    self.toolBar.frame = CGRectMake(0, 0, WIDTH_VIEW, HEIGHT_TOOLBAR);
    NSMutableArray *items = [NSMutableArray array];
    [items addObject:BARBUTTON(@"取消", @selector(clickDateCancel))];
    [items addObject:SYSBARBUTTON(UIBarButtonSystemItemFlexibleSpace, nil)];
    [items addObject:BARBUTTON(@"确定", @selector(clickDateEnter))];
    self.toolBar.items = items;
    self.toolBar.backgroundColor = [UIColor redColor];
    [self addSubview:self.toolBar];
    
    
    self.datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, HEIGHT_TOOLBAR, WIDTH_VIEW, HEIGHT_TOOLBAR)];
    self.datePicker.frame = CGRectMake(0, HEIGHT_TOOLBAR, WIDTH_VIEW, HEIGHT_DATEPICKER);
    self.datePicker.datePickerMode = UIDatePickerModeDate;
    self.datePicker.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    self.datePicker.backgroundColor = [UIColor purpleColor];
    [self addSubview:self.datePicker];

}


@end
