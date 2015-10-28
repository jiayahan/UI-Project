//
//  LifeViewController.m
//  UI Project
//
//  Created by 中软mini011 on 15/10/8.
//  Copyright (c) 2015年 中软mini011. All rights reserved.
//

#import "LifeViewController.h"
#import "LifeHeaderView.h"
#import "LifeTableViewCell.h"
#import "LifeEngine.h"

#import "LifeTableViewCell.h"
#import "LifeTableViewCellData.h"

#import "LifeSubViewController.h"


@interface LifeViewController ()<UITableViewDelegate,UITableViewDataSource,LifeHeaderViewDelegate,LifeTableviewCellDelegate>
{
    UITableView * _tableView;
    
    NSMutableDictionary * _itemLists;
    
    LifeTableViewCell * cell;
    
    NSArray * _miniArray;
    
    BOOL _dataGet;
}

@property(nonatomic,strong)LifeHeaderView * headerView;
@end

@implementation LifeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

  //  _dataGet = NO;
    
    [self initTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self navigationBarBtn];
    
    [self initBanner];
    
    [self getTableViewDataSource];
}

-(void)navigationBarBtn
{
    UIImage * leftButtonImage = [[UIImage imageNamed:@"life_Lbtn@2x.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:leftButtonImage style:UIBarButtonItemStyleDone target:self action:@selector(leftBtn:)];
    
    UIImage * rightButtonImage = [[UIImage imageNamed:@"life_Rbtn@2x.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:rightButtonImage style:UIBarButtonItemStyleDone target:self action:@selector(rightBtn:)];
}

-(void)leftBtn:(id)sender
{
    NSLog(@"人");
}

-(void)rightBtn:(id)sender
{
    NSLog(@"铃铛");
}

#pragma mark- initBanner
-(void)initBanner
{
    NSMutableArray * _imageArray = [[NSMutableArray alloc] init];
    
    for (int index = 1; index<6; index++)
    {
        NSString * imageName = [[NSString alloc] initWithFormat:@"life_Banner%d.png",index];
        
        [_imageArray addObject:imageName];
    }
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    NewFuction * bannerView = [NewFuction showNewFuction:HWScrollViewTypeBanner ImageArray:_imageArray];
    
    [_headerView addSubview:bannerView];
}

-(LifeHeaderView *)lifeheaderView
{
    if (_headerView == nil)
    {
        _headerView = [[LifeHeaderView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 234)];
        
        _headerView.delegate = self;
    }
    
    return _headerView;
}

//调用Engine层的数据
-(void)getTableViewDataSource
{
    if (_itemLists)
    {
        [_itemLists removeAllObjects];
        _itemLists = nil;
    }
    _itemLists = (NSMutableDictionary *)[[LifeEngine shareInstance] getLifeTableViewData];
}

-(void)getNewTableViewDataSouce
{
    if (_itemLists)
    {
        [_itemLists removeAllObjects];
        _itemLists = nil;
    }
    
    _itemLists = (NSMutableDictionary *)[[LifeEngine shareInstance] getNewLifeTableViewData];
}


-(void)initTableView
{
    _tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    
    _tableView.backgroundColor = [UIColor whiteColor];
    
    _tableView.delegate = self;
    
    _tableView.dataSource = self;
    
    _tableView.showsHorizontalScrollIndicator = NO;
    
    _tableView.showsVerticalScrollIndicator = NO;
    
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    
    _tableView.tableHeaderView = self.lifeheaderView;
    
    self.headerView.Data = [[LifeEngine shareInstance] getLifeHeaderViewData];
    
    
    [self.headerView updateLifeHeaderViewData];
    
    UIView * footView = [[UIView alloc] initWithFrame:CGRectMake(0, Screen_Height-60, Screen_Width, 60)];
    footView.backgroundColor = [UIColor clearColor];
    
    _tableView.tableFooterView = footView;
    
    [self.view addSubview:_tableView];
}

#pragma mark- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ((NSArray *) [_itemLists objectForKey:[NSString stringWithFormat:@"array%ld",(long)section+1]]).count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return _itemLists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellType = @"cellType";
    
    
    cell = [tableView dequeueReusableCellWithIdentifier:cellType];

    if (cell == nil)
    {
        cell = [[LifeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellType];
        
        cell.delegate = self;
        
    }
    
    NSArray * items = [_itemLists objectForKey:[NSString stringWithFormat:@"array%ld",(long)indexPath.section+1]];
    
    if (indexPath.row >= 0 && indexPath.row <items.count)
    {
        _miniArray = (NSArray *)[_itemLists objectForKey:[NSString stringWithFormat:@"array%ld",(long)indexPath.section+1]];
        
        LifeTableViewCellData * life = [_miniArray objectAtIndex:indexPath.row];
        
        cell.Data = life;
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    [cell updateLifeCell];
    
    return cell;
}

#pragma mark- UITableViewDelegate

//Cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
}

//两个cell的间距
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LifeSubViewController * allSubView = [[LifeSubViewController alloc] init];
    
    _miniArray = (NSArray *)[_itemLists objectForKey:[NSString stringWithFormat:@"array%ld",(long)indexPath.section+1]];
    
    allSubView.allSubData = [_miniArray objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:allSubView animated:YES];
    
//    switch (indexPath.section)
//    {
//        case 0:
//        {
//            
//            NSLog(@"爱情碎碎念");
//        }
//            break;          
//        case 1:
//        {
//             NSLog(@"星座与爱情");
//        }
//            break;
//        case 2:
//        {
//             NSLog(@"恋爱求助小组");
//        }
//            break;
//        case 3:
//        {
//             NSLog(@"异地了又怎样");
//        }
//            break;
//        case 4:
//        {
//             NSLog(@"我们要结婚了");
//        }
//            break;
//        case 5:
//        {
//             NSLog(@"微爱建议反馈");
//        }
//            break;
//        default:
//            break;
//    }
}
#pragma mark- LifeHeaderViewDelegate
-(void)logoLifeHeaderViewClicked:(id)sender
{
    if(sender && [sender isKindOfClass:[UIButton class]])
    {
        UIButton * bt = (UIButton *)sender;
        
        switch (bt.tag)
        {
            case Talk_Button:
            {
//                _dataGet = NO;
//                
//                [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInt:Talk_Button] forKey:@"AllStore"];

                [self talkcontent];
            }
                break;
            case Funny_Button:
            {
//                _dataGet = YES;
//                
//                [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInt:Funny_Button] forKey:@"AllStore"];

                [self funnycontent];
            }
                break;
            default:
                break;
        }
    
    }
}

-(void)talkcontent
{
    [self getTableViewDataSource];
    
    [_tableView reloadData];
}

-(void)funnycontent
{
    [self getNewTableViewDataSouce];
    
     [_tableView reloadData];
}

#pragma mark- LifeTableviewCellDelegate
    
-(void)LifeCellClickedWithImageView
{
        NSLog(@"rrr");
}


@end

