//
//  NSBubbleData.h
//  聊天泡泡V2
//
//  Created by Joe on 14-9-17.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    NSBubbleTypeMe,
    NSBubbleTypeSomeone
} NSbubbleType;

@interface NSBubbleData : NSObject

// 消息发送时间
@property (nonatomic, strong, readonly) NSDate *date;
// 消息内容
@property (nonatomic, strong, readonly) NSString *message;
// 消息发送方（对方或自己）
@property (nonatomic) NSbubbleType type;

// 实例华消息包
+ (id)initBubbleData:(NSString *)message sendDate:(NSDate *)date dataType:(NSbubbleType)type;


@end
