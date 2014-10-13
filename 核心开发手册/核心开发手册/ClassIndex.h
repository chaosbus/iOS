//
//  ClassIndex.h
//  核心开发手册
//
//  Created by Joe on 14-10-10.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClassIndex : NSObject
@property (nonatomic, assign) Class controllerClass;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *identifier;

+ (instancetype)classIndexWithTitle:(NSString *)title classObject:(Class)controllerClass;
+ (instancetype)classIndexWithTitle:(NSString *)title classObject:(Class)controllerClass identifier:(NSString *)identifier;

@end
