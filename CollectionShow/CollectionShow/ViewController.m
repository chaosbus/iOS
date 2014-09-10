//
//  ViewController.m
//  CollectionShow
//
//  Created by Joe on 14-9-10.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "ViewController.h"
#import "MyColorCell.h"

@interface ViewController ()

@property (nonatomic) NSMutableArray *datalist;
@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.collectionView registerClass:[MyColorCell class] forCellWithReuseIdentifier:@"cell"];
    
    [self test];
//    UINib *cellNib = [UINib nibWithNibName:@"ViewController" bundle:nil];
//    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:@"cell"];
//    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
//    [flowLayout setItemSize:CGSizeMake(100, 100)];
//    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
//    flowLayout.sectionInset = UIEdgeInsetsMake(0, 2, 0, 0);
//    [self.collectionView setCollectionViewLayout:flowLayout];
    
    
    
//    self.collectionView.delegate = self;
//    self.collectionView.dataSource = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)test
{
    _datalist = [[NSMutableArray alloc] initWithObjects:
                 @"Alpha", @"Bravo", @"Charlie", @"Delta", @"Echo", @"Foxtrot", @"Golf",
                 @"Hotel", @"India", @"Juliet", @"Kilo", @"Lima", @"Mike", @"November",
                 @"Oscar", @"Papa", @"Quebec", @"Romeo", @"Sierra", @"Tango",
                 @"Uniform", @"Victor", @"Whiskey", @"Xray", @"Yankee", @"Zulu", @"end", nil];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _datalist.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = @"cell";

    MyColorCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor colorWithRed:((10 * indexPath.row) / 255.0) green:((20 * indexPath.row)/255.0) blue:((30 * indexPath.row)/255.0) alpha:1.0f];

    return cell;
}

////定义每个UICollectionView 的大小
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    return CGSizeMake(96, 100);
//}
//
////定义每个UICollectionView 的 margin
//-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
//{
//    return UIEdgeInsetsMake(5, 5, 5, 5);
//}




//- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
//{
//
//}

@end
