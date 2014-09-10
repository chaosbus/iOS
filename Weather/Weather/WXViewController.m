//
//  WXViewController.m
//  Weather
//
//  Created by Joe on 14-8-19.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "WXViewController.h"
#import <LBBlurredImage/UIImageView+LBBlurredImage.h>

@interface WXViewController ()

@property (nonatomic, strong) UIImageView *backgroundImageView;
@property (nonatomic, strong) UIImageView *blurredImageVIew;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) CGFloat screenHeight;

@end

@implementation WXViewController

- (id)init
{
    if (self = [super init]) {
        _hourlyFormatter = [[NSDateFormatter alloc] init];
        _hourlyFormatter.dateFormat = @"h a";
        
        _dailyFormatter = [[NSDateFormatter alloc] init];
        _dailyFormatter.dateFormat = @"EEEE";
    }
    
    return self;
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
    // Do any additional setup after loading the view.
    
//    self.view.backgroundColor = [UIColor redColor];
    
    CGRect headerFrame = [UIScreen mainScreen].bounds;
    // mainScreen: [0.000000, 0.000000], [480.000000, 320.000000]
    NSLog(@"mainScreen: [%f, %f], [%f, %f]",
          headerFrame.origin.x, headerFrame.origin.y,
          headerFrame.size.height, headerFrame.size.width);
    
    /* Stage 1 */
    // 1 获取并存储屏幕高度。之后，你将在用分页的方式来显示所有天气​​数据时，使用它。
    self.screenHeight = [UIScreen mainScreen].bounds.size.height;
    UIImage *background = [UIImage imageNamed:@"bg"];
    
    // 2 创建一个静态的背景图，并添加到视图上。
    self.backgroundImageView = [[UIImageView alloc] initWithImage:background];
    self.backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
    
    [self.view addSubview:self.backgroundImageView];
    
    // 3 使用LBBlurredImage来创建一个模糊的背景图像，并设置alpha为0，使得开始backgroundImageView是可见的。
    self.blurredImageVIew = [[UIImageView alloc]init];
    self.blurredImageVIew.contentMode = UIViewContentModeScaleAspectFill;
    self.blurredImageVIew.alpha = 0;
    [self.blurredImageVIew setImageToBlur:background blurRadius:10 completionBlock:nil];
    
    [self.view addSubview:self.blurredImageVIew];
    
    // 4 创建tableview来处理所有的数据呈现。
    self.tableView = [[UITableView alloc] init];
    self.tableView.backgroundColor =  [UIColor clearColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorColor = [UIColor colorWithWhite:1 alpha:0.2];
    self.tableView.pagingEnabled = YES;

    [self.view addSubview:self.tableView];
    
    /* Stage 2 */
    CGFloat inset = 20;
    CGFloat temperatureHeight = 110;
    CGFloat hiloHeight = 40;
    CGFloat iconHeight = 30;
    // 4
    CGRect hiloFrame = CGRectMake(inset,
                                  headerFrame.size.height - hiloHeight,  // 480-40
                                  headerFrame.size.width - (2 * inset),  // 320-(2*20)
                                  hiloHeight);                           // 40
    
    CGRect temperatureFrame = CGRectMake(inset,
                                         headerFrame.size.height - (temperatureHeight + hiloHeight),    // 480-(110+40)
                                         headerFrame.size.width - (2 * inset),  // 320-(2*20)
                                         temperatureHeight);
    
    CGRect iconFrame = CGRectMake(inset,
                                  temperatureFrame.origin.y - iconHeight,
                                  iconHeight,
                                  iconHeight);
    
    // 5
    CGRect conditionsFrame = iconFrame;
    conditionsFrame.size.width = self.view.bounds.size.width - (((2 * inset) + iconHeight) + 10);
    conditionsFrame.origin.x = iconFrame.origin.x + (iconHeight + 10);
    NSLog(@"selfVIew: [%f, %f], [%f, %f]",
          self.view.bounds.origin.x, self.view.bounds.origin.y,
          self.view.bounds.size.height, self.view.bounds.size.width);
    
    /* Stage 3 */
    // 1
    UIView *header = [[UIView alloc] initWithFrame:headerFrame];
    header.backgroundColor = [UIColor clearColor];
    self.tableView.tableFooterView = header;
    
    // 2
    // bottom left
    UILabel *temperatureLabel = [[UILabel alloc] initWithFrame:temperatureFrame];
    temperatureLabel.backgroundColor = [UIColor greenColor];
    temperatureLabel.textColor = [UIColor whiteColor];
    temperatureLabel.text = @"0°";
    temperatureLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:120];
    [header addSubview:temperatureLabel];
    
    // bottom left
    UILabel *hiloLabel = [[UILabel alloc] initWithFrame:hiloFrame];
    hiloLabel.backgroundColor = [UIColor redColor];
    hiloLabel.textColor = [UIColor whiteColor];
    hiloLabel.text = @"0°/0°";
    hiloLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:28];
    [header addSubview:hiloLabel];
    
    // top
    UILabel *cityLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, 30)]; // 居中对齐
    cityLabel.backgroundColor = [UIColor purpleColor];
    cityLabel.textColor = [UIColor whiteColor];
    cityLabel.text = @"Loading city...";
    cityLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:18];
    cityLabel.textAlignment = NSTextAlignmentCenter;
    [header addSubview:cityLabel];
    
    UILabel *conditionsLabel = [[UILabel alloc] initWithFrame:conditionsFrame];
    conditionsLabel.backgroundColor = [UIColor grayColor];
    conditionsLabel.textColor = [UIColor whiteColor];
    conditionsLabel.text = @"--conditionsLabel--";
    conditionsLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:18];
    [header addSubview:conditionsLabel];
    
    // 3
    // bottom left
    UIImageView *iconView = [[UIImageView alloc] initWithFrame:iconFrame];
    iconView.contentMode = UIViewContentModeScaleAspectFit;
    iconView.backgroundColor = [UIColor clearColor];
    [header addSubview:iconView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    CGRect bounds = self.view.bounds;
    
    self.backgroundImageView.frame = bounds;
    self.blurredImageVIew.frame = bounds;
    self.tableView.frame = bounds;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    if (section == 0)
//        return MIN(<#A#>, <#B#>);
//    else
//        return MIN(<#A#>, <#B#>);
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellId = @"CellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellId];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.textColor = [UIColor whiteColor];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    return 44;
    NSInteger cellCount = [self tableView:tableView numberOfRowsInSection:indexPath.section];
    return self.screenHeight / (CGFloat)cellCount;
}


#pragma mark - 模糊背影
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat height = scrollView.bounds.size.height;
    CGFloat position = MAX(scrollView.contentOffset.y, 0.0);
    
    CGFloat percent = MIN(position / height, 1.0);
    self.blurredImageVIew.alpha = percent;
}

@end
