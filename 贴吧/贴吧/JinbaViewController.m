//
//  JinbaViewController.m
//  贴吧
//
//  Created by Joe on 14-9-9.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "JinbaViewController.h"
#import "TiebaCollectionCell.h"

@interface JinbaViewController ()
@property (nonatomic) NSMutableArray *datalist;
@end

@implementation JinbaViewController

- (void)test
{
    _datalist = [[NSMutableArray alloc] initWithObjects:
                @"Alpha", @"Bravo", @"Charlie", @"Delta", @"Echo", @"Foxtrot", @"Golf",
                @"Hotel", @"India", @"Juliet", @"Kilo", @"Lima", @"Mike", @"November",
                @"Oscar", @"Papa", @"Quebec", @"Romeo", @"Sierra", @"Tango",
                @"Uniform", @"Victor", @"Whiskey", @"Xray", @"Yankee", @"Zulu", nil];
}

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
    if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0)) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    self.navigationItem.title = @"进吧";
//    self.tabBarItem.title = @"jinba";
//    self.tabBarController.tabBarItem.title = @"123";
//    self.navigationController.navigationBarHidden = YES;
    
    [self test];
    self.scrollView.contentSize = CGSizeMake(320, 600);
}

//- (void)viewDidAppear:(BOOL)animated
//{
//    [super viewDidAppear:YES];
//    [self.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





//
////- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
////{
////    return _datalist.count;
////}
//
//- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
//{
//    return _datalist.count;
//}
//
//- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    NSString *cellIdentify = @"TiebaCollectionCell";
//    TiebaCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentify forIndexPath:indexPath];
//    cell.barName.text = [_datalist objectAtIndex:(indexPath.section*2 + indexPath.row)];
//    
//    return cell;
//}
//
////- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
////{
////    
////}

@end
