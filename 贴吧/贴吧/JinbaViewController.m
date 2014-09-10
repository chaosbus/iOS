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
    [self.collectionView registerClass:[TiebaCollectionCell class] forCellWithReuseIdentifier:@"cell"];
}

#pragma makr - 添加导航左右键
- (void)addBarButtonItem
{
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc]
                                initWithTitle:@"目录"
                                style:UIBarButtonItemStyleBordered
                                target:self
                                action:nil];
    self.navigationItem.leftBarButtonItem = leftBtn;
    
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]
                                 initWithTitle:@"一键签到"
                                 style:UIBarButtonItemStyleBordered
                                 target:self
                                 action:nil];
    self.navigationItem.rightBarButtonItem = rightBtn;
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
    
    TiebaCollectionCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    if (!cell) {
        NSLog(@"cell is null");
        cell = [[TiebaCollectionCell alloc] init];
    }
    
//    cell.backgroundColor = [UIColor colorWithRed:((10 * indexPath.row) / 255.0) green:((20 * indexPath.row)/255.0) blue:((30 * indexPath.row)/255.0) alpha:1.0f];
    
    cell.tiebaName.text = [_datalist objectAtIndex:(indexPath.section*2 + indexPath.row)];
    cell.tiebaLevel.text = [NSString stringWithFormat:@"%d", ((arc4random_uniform(20)+1)%20)];
    
    
    return cell;
}



@end
