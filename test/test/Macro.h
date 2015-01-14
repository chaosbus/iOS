//
//  Macro.h
//  HotelBooking
//
//  Created by Joe on 15/1/9.
//  Copyright (c) 2015年 Joe. All rights reserved.
//

#ifndef HotelBooking_Macro_h
#define HotelBooking_Macro_h

#define BARBUTTON(TITLE, SELECTOR) [[UIBarButtonItem alloc] initWithTitle:TITLE style:UIBarButtonItemStylePlain target:self action:SELECTOR]
#define SYSBARBUTTON(ITEM, SELECTOR) [[UIBarButtonItem alloc] initWithBarButtonSystemItem:ITEM target:self action:SELECTOR]
#define BARBUTTON_WITH_IMAGE(imagename, selector)   [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:imagename] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:selector]



#endif
