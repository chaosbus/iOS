//
//  JinbaViewController.h
//  贴吧
//
//  Created by Joe on 14-9-9.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JinbaViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@end
