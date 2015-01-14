//
//  DatePickerView.m
//  HotelBooking
//
//  Created by Joe on 15/1/9.
//  Copyright (c) 2015年 Joe. All rights reserved.
//

#import "DatePickerView.h"
#import "Macro.h"

#define HEIGHT_DATAPICKER   200.0f
#define HEIGHT_TOOLBAR      44.0f
#define WIDTH_VIEW          self.window.frame.size.width

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
    self.backgroundColor = [UIColor yellowColor];

    [self initMyself];
    
    return self;
}

//- (instancetype)initWithFrame:(CGRect)frame {
//    self = [super initWithFrame:frame];
//    
//    return self;
//}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self initMyself];
}

- (void)initMyself {
    self.datePicker = [[UIDatePicker alloc] init];
    self.datePicker.frame = CGRectMake(0, HEIGHT_TOOLBAR, WIDTH_VIEW, HEIGHT_DATAPICKER);
    self.datePicker.datePickerMode = UIDatePickerModeDate;
    self.datePicker.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    self.datePicker.backgroundColor = [UIColor purpleColor];
    [self addSubview:self.datePicker];
    
    self.toolBar = [[UIToolbar alloc] init];
    self.toolBar.frame = CGRectMake(0, 0, WIDTH_VIEW, HEIGHT_TOOLBAR);
    NSMutableArray *items = [NSMutableArray array];
    [items addObject:BARBUTTON(@"取消", @selector(selectDateCancel))];
    [items addObject:SYSBARBUTTON(UIBarButtonSystemItemFlexibleSpace, nil)];
    [items addObject:BARBUTTON(@"确定", @selector(selecteDateOkay))];
    self.toolBar.items = self.toolBarItems;
    self.toolBar.backgroundColor = [UIColor redColor];
    [self addSubview:self.toolBar];
    
    self.frame = CGRectMake(0, 0, WIDTH_VIEW, HEIGHT_DATAPICKER + HEIGHT_TOOLBAR);
}

- (void)selecteDateOkay {
    self.selectedDate = [self.datePicker date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yy-MM-dd HH:mm:ss"];
    NSString *dateAndTime = [dateFormatter stringFromDate:self.selectedDate];
    NSLog(@"selectDateOK : %@", dateAndTime);
}

- (void)selectDateCancel {
    NSLog(@"selectDateCancel");
}

@end
