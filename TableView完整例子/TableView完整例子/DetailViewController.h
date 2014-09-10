//
//  DetailViewController.h
//  TableView完整例子
//
//  Created by Joe on 14-9-2.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *codeTextField;
@property (weak, nonatomic) IBOutlet UITextField *snTextField;
@property (strong, nonatomic) IBOutlet NSObject *objCode;
@property (strong, nonatomic) IBOutlet NSObject *objSN;
@end
