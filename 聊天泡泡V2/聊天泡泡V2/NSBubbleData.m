//
//  NSBubbleData.m
//  聊天泡泡V2
//
//  Created by Joe on 14-9-17.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "NSBubbleData.h"

@implementation NSBubbleData

@synthesize message = _message;

/**
 * 实例化
 */
+ (id)initBubbleData:(NSString *)message sendDate:(NSDate *)date dataType:(NSbubbleType)type
{
    return [[NSBubbleData alloc]initWithData:message sendDate:date dataType:type];
}

- (NSBubbleData *)initWithData:(NSString *)message sendDate:(NSDate *)date dataType:(NSbubbleType)type
{
    self = [super init];
    if (self) {
        _message = (!message || !message.length) ? @" " : message;
        _date = date;
        _type = type;
    }
    
    return self;
}
@end
