//
//  MyUIViewController.h
//  SearchbarSimpleTable
//
//  Created by Joe on 14-7-30.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyUIViewController : UITableViewController <UISearchDisplayDelegate>

@property (nonatomic, strong) NSDictionary *dictData;
@property (nonatomic, strong) NSArray * listGroupname;

@end
