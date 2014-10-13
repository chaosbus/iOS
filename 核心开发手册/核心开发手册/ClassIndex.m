//
//  ClassIndex.m
//  核心开发手册
//
//  Created by Joe on 14-10-10.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "ClassIndex.h"

@implementation ClassIndex

+ (instancetype)classIndexWithTitle:(NSString *)title classObject:(Class)controllerClass
{
    ClassIndex *cls = [[self alloc] init];
    cls.title = title;
    cls.controllerClass = controllerClass;
    
    return cls;
}

+ (instancetype)classIndexWithTitle:(NSString *)title classObject:(Class)controllerClass identifier:(NSString *)identifier
{
    ClassIndex *cls = [[self alloc] init];
    cls.title = title;
    cls.controllerClass = controllerClass;
    cls.identifier = identifier;
    
    return cls;
}

@end
