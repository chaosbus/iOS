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

@property (nonatomic, strong, readonly) NSDate *date;
@property (nonatomic, strong, readonly) NSString *message;
@property (nonatomic) NSbubbleType type;


@end
