//
//  OriginalImage.m
//  贴吧
//
//  Created by Joe on 14-9-11.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "UIImageOriginal.h"

@implementation UIImageOriginal

+ (UIImage *)imageOriginalNamed:(NSString *)imageName
{
    return [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

@end
