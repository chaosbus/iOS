//
//  ExamViewController.m
//  分页
//
//  Created by Joe on 14-8-22.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "ExamViewController.h"

@interface ExamViewController ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *myArray;
@property (nonatomic, strong) NSMutableArray *myArray1;
@end

@implementation ExamViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        _myArray = [[NSMutableArray alloc] init];//WithObjects:@"haha", @"gaga", nil];
        int i = 0;
        for (i=0; i<10; i++) {
            NSString *tmp = [NSString stringWithFormat:@"roge%d", i];
            [_myArray addObject:tmp];
        }
//        NSLog(@"%@", _myArray);
        
        _myArray1 = [[NSMutableArray alloc] initWithObjects:@"alpha", @"beta", @"capa", @"delta", @"echo", /*@"fox", @"gaga", */nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    self.tableView = [[UITableView alloc] init];
    self.tableView.backgroundColor =  [UIColor redColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
//    self.tableView.separatorColor = [UIColor colorWithWhite:1 alpha:0.2];
    self.tableView.pagingEnabled = YES;
    
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    CGRect bounds = self.view.bounds;
    bounds.origin.y = 20;
    
    self.tableView.frame = bounds;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellId = @"CellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    
    // 获取当前所在section
    NSInteger section = [indexPath section];
    
    if (section == 0) {
        if (!indexPath.row)
            cell.textLabel.text = @"SECTION ONE";
        else {
            NSString *tile = [_myArray objectAtIndex:indexPath.row];
            cell.textLabel.text = tile;
        }
        cell.backgroundColor = [UIColor purpleColor];
    } else {
        if (!indexPath.row)
            cell.textLabel.text = @"SECTION 2";
        else {
            NSString *tile = [_myArray1 objectAtIndex:indexPath.row];
            cell.textLabel.text = tile;
        }
        cell.backgroundColor = [UIColor brownColor];
    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    NSLog(@"%i", _myArray.count);
    if (section == 0)
        return _myArray.count;
    else
        return _myArray1.count;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    return 90;
    NSInteger cellCount = [self tableView:tableView numberOfRowsInSection:indexPath.section];
//    return (640-20) / (CGFloat)cellCount;
    NSLog(@"cellCount:%i", cellCount);
    NSLog(@"height:%f", [UIScreen mainScreen].bounds.size.height);
    return ([UIScreen mainScreen].bounds.size.height-20) / cellCount;
}

//- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
//{
//    if (section == 0) {
//        return @"Footer 1";
//    } else
//        return @"Footer 2";
//}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (0 == section) {
        return @"Header 1";
    } else
        return @"Header 2";
}

-tableview



@end
