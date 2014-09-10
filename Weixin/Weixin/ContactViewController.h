//
//  ContactViewController.h
//  Weixin
//
//  Created by Joe on 14-9-4.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactViewController : UIViewController <UINavigationBarDelegate, UINavigationControllerDelegate>
{
    
    __weak IBOutlet UITableView *contactTableView;
}
@end
