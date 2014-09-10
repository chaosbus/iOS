//
//  ViewController.h
//  CollectionShow
//
//  Created by Joe on 14-9-10.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout> 
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end
