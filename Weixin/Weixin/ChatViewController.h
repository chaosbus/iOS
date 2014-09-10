//
//  ChatViewController.h
//  Weixin
//
//  Created by Joe on 14-9-4.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChatViewController : UIViewController <UINavigationControllerDelegate, UINavigationBarDelegate, UITableViewDataSource, UITableViewDelegate>
{
    __weak IBOutlet UITableView *chatTableView;
    __weak IBOutlet UIView *chatBarView;
    __weak IBOutlet UIButton *chatBarMoreBtn;
    __weak IBOutlet UIButton *chatBarEmotionBtn;
    __weak IBOutlet UIButton *chatBarVoiceBtn;
    __weak IBOutlet UITextField *chatBarTextFiled;
}
@end
