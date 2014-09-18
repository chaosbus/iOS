//
//  TiebaCollectionCell.h
//  贴吧
//
//  Created by Joe on 14-9-10.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TiebaCollectionCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *tiebaLevel;
@property (weak, nonatomic) IBOutlet UILabel *tiebaName;
#define TIEBA_COLLECTION_CELL_IDENTIFIER    @"TiebaCollectionCell"
@end
