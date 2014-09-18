//
//  JinbaViewController.m
//  贴吧
//
//  Created by Joe on 14-9-9.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "JinbaViewController.h"
#import "TiebaCollectionCell.h"
#import "TiebaViewController.h"
#import "JinbaSearchHeader.h"
#import "UIImageOriginal.h"
#import "CatalogueView.h"
#import "TBNavViewController.h"

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
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.modalPresentationCapturesStatusBarAppearance = NO;
    }
    self.navigationItem.title = @"进吧";
//    self.tabBarItem.title = @"jinba";
//    self.tabBarController.tabBarItem.title = @"123";
//    self.navigationController.navigationBarHidden = YES;
    
    [self test];
    [self registerCustomCell];
    [self addBarButtonItem];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 注册自定义Cell
- (void)registerCustomCell
{
    // 在ViewDidLoad方法中声明Cell的类，在ViewDidLoad方法中添加，此句不声明，将无法加载，程序崩溃
    [self.collectionView registerClass:[TiebaCollectionCell class] forCellWithReuseIdentifier:TIEBA_COLLECTION_CELL_IDENTIFIER];
    [self.collectionView registerClass:[JinbaSearchHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:JINBA_SEARCH_HEADER_IDENTIFIER];
}

#pragma makr - 添加导航左右键
- (void)addBarButtonItem
{
#if 1
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc]
                                initWithTitle:@"目录"
                                style:UIBarButtonItemStyleBordered
                                target:self
                                action:@selector(actionToCatalogue)];
    self.navigationItem.leftBarButtonItem = leftBtn;
#else
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithImage:[UIImageOriginal imageOriginalNamed:@"name"]
                                                                style:UIBarButtonItemStyleBordered
                                                               target:nil
                                                               action:nil];
#endif
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]
                                 initWithTitle:@"一键签到"
                                 style:UIBarButtonItemStyleBordered
                                 target:self
                                 action:nil];
    self.navigationItem.rightBarButtonItem = rightBtn;
}

#pragma mark - NavigationBar左键进入目录事件
- (void)actionToCatalogue
{
    CatalogueView *view = [[CatalogueView alloc] init];
    TBNavViewController *navView = [[TBNavViewController alloc] initWithRootViewController:view];
    [self.navigationController presentViewController:navView animated:YES completion:^{NSLog(@"去目录！");}];
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
    TiebaCollectionCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:TIEBA_COLLECTION_CELL_IDENTIFIER
                                                                           forIndexPath:indexPath];
    if (!cell) {
        NSLog(@"cell is null");
        cell = [[TiebaCollectionCell alloc] init];
    }
    
//    cell.backgroundColor = [UIColor colorWithRed:((10 * indexPath.row) / 255.0) green:((20 * indexPath.row)/255.0) blue:((30 * indexPath.row)/255.0) alpha:1.0f];
    
    cell.tiebaName.text = [_datalist objectAtIndex:(indexPath.section*2 + indexPath.row)];
    cell.tiebaLevel.text = [NSString stringWithFormat:@"%d", ((arc4random_uniform(20)+1)%20)];

    return cell;
}

#pragma mark - 选中CollectionViewCell事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    TiebaViewController *test = [[TiebaViewController alloc] init];
    test.title = [_datalist objectAtIndex:(indexPath.section*2 + indexPath.row)];
    // 设置返回标签
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleBordered target:nil action:nil];
    // 隐藏子view的tabbar
    test.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:test animated:YES];
}

#pragma mark - CollectionView的表头，类似于TableView.tableHeaderView. 在表头上放置搜索控制，可以随之滚动
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        JinbaSearchHeader *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                                                           withReuseIdentifier:JINBA_SEARCH_HEADER_IDENTIFIER
                                                                                  forIndexPath:indexPath];
        reusableview = headerView;
    } else if ( kind == UICollectionElementKindSectionFooter ) {
        UICollectionReusableView * footerview = [ collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter
                                                                                    withReuseIdentifier:@"FooterView"
                                                                                           forIndexPath:indexPath];
        
        reusableview = footerview;
    }
    
    return reusableview;
}

@end
