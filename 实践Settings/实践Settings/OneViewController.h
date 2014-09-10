//
//  OneViewController.h
//  实践Settings
//
//  Created by Joe on 14-8-8.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OneViewController : UITableViewController

// plist配置
@property (nonatomic, strong) NSDictionary *confDict;
@property (nonatomic, strong) NSArray *confGroup;

@end
