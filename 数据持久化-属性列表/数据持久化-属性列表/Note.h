//
//  Note.h
//  数据持久化-属性列表
//
//  Created by Joe on 14-8-14.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Note : NSObject

@property(nonatomic, strong) NSDate* date;
@property(nonatomic, strong) NSString* content;
@end
