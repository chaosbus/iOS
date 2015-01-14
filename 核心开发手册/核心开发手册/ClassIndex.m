//
//  ClassIndex.m
//  核心开发手册
//
//  Created by Joe on 14-10-10.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "ClassIndex.h"

@implementation ClassIndex


/*!
 @method
 @abstract 创建初始化一个ClassIndex实例
 @discussion 使用的视图是通过代码创建
 @param title 视图标题
 @param controllerClass 视图的类
 @result 返回ClassIndex实例
 */
+ (instancetype)classIndexWithTitle:(NSString *)title classObject:(Class)controllerClass
{
    ClassIndex *cls = [[self alloc] init];
    cls.title = title;
    cls.controllerClass = controllerClass;
    
    return cls;
}

/*!
 @method
 @abstract 创建初始化一个ClassIndex实例
 @discussion 使用的视图是加载xib来创建
 @param title 视图标题
 @param controllerClass 视图的类
 @result 返回ClassIndex实例
 */
+ (instancetype)classIndexWithTitle:(NSString *)title classObject:(Class)controllerClass identifier:(NSString *)identifier
{
    ClassIndex *cls = [[self alloc] init];
    cls.title = title;
    cls.controllerClass = controllerClass;
    cls.identifier = identifier;
    
    return cls;
}

@end
