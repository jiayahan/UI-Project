//
//  setUpViewController.m
//  UI Project
//
//  Created by 中软mini011 on 15/10/14.
//  Copyright (c) 2015年 中软mini011. All rights reserved.
//

#import "setUpViewController.h"
#import "setUpTableViewCell.h"
#import "setUpTableViewData.h"
#import "firatPageEngine.h"

@interface setUpViewController ()<UITableViewDataSource,UITableViewDelegate,setUpTableViewDelegate>
{
    UITableView * _setTableView;
    
    NSDictionary * _itemLists;
    
    setUpTableViewCell * cell;
    
    UILabel * _label;
    UIImageView * _centerImageView;
}

@end

@implementation setUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//     self.navigationController.navigationBarHidden = YES;
    
   [self navigationBarBtn];
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    
    [self initTableView];
    
    [self getSetUpTableViewCellData];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [_label removeFromSuperview];
    
    [_centerImageView removeFromSuperview];
}

-(void)navigationBarBtn
{
    UIImageView * leftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 10, 20, 20)];
    leftImageView.image = [[UIImage imageNamed:@"tl_photo_slide_back.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:leftImageView.image style:UIBarButtonItemStyleDone target:self action:@selector(backClicked:)];
    
    _centerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(leftImageView.frame)+25, 10, 1, 20)];
    
    _centerImageView.backgroundColor = [UIColor blackColor];
    
    _centerImageView.alpha = 0.2f;
    
     _label = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_centerImageView.frame)+14, 10, 60, 20)];
    _label.text = @"设置";
    _label.textColor = [UIColor whiteColor];
    
    [self.navigationController.navigationBar addSubview:_label];
    
    [self.navigationController.navigationBar addSubview:_centerImageView];
}

-(void)backClicked:(id)sender
{
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)getSetUpTableViewCellData
{
    _itemLists = [[firatPageEngine shareInstance] getSetUpTableViewData];
}

-(void)initTableView
{
    _setTableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
   _setTableView.backgroundColor = [UIColor colorWithRed:244/255.0 green:242/255.0 blue:233/255.0 alpha:0.5];
    
 //   _setTableView.backgroundColor = [UIColor whiteColor];
    
    _setTableView.delegate = self;
    
    _setTableView.dataSource = self;
    
    _setTableView.showsHorizontalScrollIndicator = NO;
    
    _setTableView.showsVerticalScrollIndicator = YES;
    
    _setTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    
    _setTableView.scrollEnabled = YES;
    
    _setTableView.clipsToBounds = YES;
    
    [self.view addSubview:_setTableView];
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
        cell = [[setUpTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellType];
        
        cell.delegate = self;
    }
    
    NSArray * items = [_itemLists objectForKey:[NSString stringWithFormat:@"array%ld",(long)indexPath.section+1]];
    
    //判断cell
    if (indexPath.row >=0 && indexPath.row< items.count)
    {
        NSArray * miniArray = (NSArray *)[_itemLists objectForKey:[NSString stringWithFormat:@"array%ld",(long)indexPath.section+1]];
        
        setUpTableViewData * setUp = [miniArray objectAtIndex:indexPath.row];
        
        cell.Data = setUp;
        
        
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    [cell updateSetUpCell];
    return cell;
}


#pragma mark- UITableViewDelegate
//Cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 3;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
   return 7;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section)
    {
        case 0:
        {
            switch (indexPath.row)
            {
                case 0:
                {
                    NSLog(@"个人资料");
                }
                    break;
                    
                default:
                    break;
            }
        }
            break;
        case 1:
        {
            switch (indexPath.row)
            {
                case 0:
                {
                    NSLog(@"主题颜色");
                }
                    break;
                case 1:
                {
                    NSLog(@"表情商店");
                }
                    break;
                case 2:
                {
                    NSLog(@"头像装饰");
                }
                    break;
                default:
                    break;
            }
        }
            break;
        case 2:
        {
            switch (indexPath.row)
            {
                case 0:
                {
                    NSLog(@"使用设置");
                }
                    break;
                case 1:
                {
                    NSLog(@"帮助中心");
                }
                    break;
                default:
                    break;
            }
        }
            break;
        case 3:
        {
            switch (indexPath.row)
            {
                case 0:
                {
                    NSLog(@"如果喜欢，请给微爱好评");
                }
                    break;
                case 1:
                {
                    NSLog(@"关于微爱");
                }
                    break;
                case 2:
                {
                    NSLog(@"加入微爱");
                }
                    break;
                default:
                    break;
            }
        }
            break;

        case 4:
        {
            switch (indexPath.row)
            {
                case 0:
                {
                    NSLog(@"情侣推荐应用");
                }
                    break;
                case 1:
                {
                    NSLog(@"退出微爱");
                }
                    break;
                default:
                    break;
            }
        }
            break;

        default:
            break;
    }
}


#pragma mark- setUpTableViewDelegate
-(void)setUpCellClikedWithImageView
{
    
}
@end
