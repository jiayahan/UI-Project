//
//  TimeViewController.m
//  UI Project
//
//  Created by 中软mini011 on 15/10/8.
//  Copyright (c) 2015年 中软mini011. All rights reserved.
//

#import "TimeViewController.h"

#import "TimeHeaderView.h"
#import "TimeEngine.h"
#import "LeftViewController.h"
#import "RightViewController.h"
#import "TimeTableViewCell.h"

#import "DisplayView.h"


@interface TimeViewController ()<UITableViewDelegate,UITableViewDataSource,TimeHeaderViewDelegate,TimeTableViewCellDelegate>
{
    UITableView * _tableView;
    
    NSDictionary * _imageList;
    
    BOOL flag;
    
    DisplayView * _view1;
}

@property(nonatomic,strong)TimeHeaderView * headerView;

@end

@implementation TimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self navigationBarBtn];
    
    //调用创建TableView的方法
    [self initTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}


-(void)navigationBarBtn
{
    UIImage * leftBtnImage = [[UIImage imageNamed:@"Time_Lbtn1@2x.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:leftBtnImage style:UIBarButtonItemStyleDone target:self action:@selector(leftBtn:)];
    
    UIImage * rightBtnImage = [[UIImage imageNamed:@"Time_Rbtn@2x.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:rightBtnImage style:UIBarButtonItemStyleDone target:self action:@selector(rightBtn:)];
}

-(void)leftBtn:(id)sender
{
    if (sender && [sender isKindOfClass:[UIBarButtonItem class]])
    {
        if (flag)
        {
            flag = NO;
            UIImage * leftBtnImage = [[UIImage imageNamed:@"Time_Lbtn1@2x.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            
            self.navigationItem.leftBarButtonItem.image =leftBtnImage;
            
            [_view1 removeFromSuperview];
            _view1=nil;

        }else{
            flag = YES;
           
            UIImage * leftSeclectBtnImage = [[UIImage imageNamed:@"Time_Lbtn2@2x.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            
            self.navigationItem.leftBarButtonItem.image =leftSeclectBtnImage;
            
            _view1 = [[DisplayView alloc] init];
            
            _view1.frame=CGRectMake(0, 0, Screen_Width, Screen_Height-64);
            
            [self.view.superview addSubview:_view1];

        }
    }
}

-(void)rightBtn:(id)sender
{
    NSLog(@"心");
}

//get方法
-(TimeHeaderView *)timeHeaderView
{
    if (_headerView == nil)
    {
        _headerView = [[TimeHeaderView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 162)];
        
        _headerView.delegate = self;
    
    }
    return _headerView;
}

#pragma mark- initTableView
-(void)initTableView
{
    _tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    
    _tableView.backgroundColor = [UIColor colorWithRed:244/255.0f green:241/255.0f blue:235/255.0f alpha:1];
    //设置数据源，必须实现对应的UITableViewDataSource协议
    _tableView.dataSource = self;
    
    //设置代理
    _tableView.delegate = self;
    
    //自动调整自己的高度，保证与superView顶部和底部的距离不变
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    
    //水平线
    _tableView.showsHorizontalScrollIndicator = NO;
    
    //垂直线
    _tableView.showsVerticalScrollIndicator = NO;
    
    
   _tableView.tableHeaderView = self.timeHeaderView;
    
    self.headerView.Data = [[TimeEngine shareInstance] getTimeHeaderViewData];
    
    [self.headerView updateTimeHeaderViewData];
    
    [self.view addSubview:_tableView];
}

#pragma mark- UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellType = @"cellType";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellType];
    
    if (cell == nil)
    {
        cell = [[TimeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellType];
    

    }
    
       return cell;
}

#pragma mark- UITableViewDelegate
//Cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return Screen_Height;
}

//两个cell的间距
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
    
}

#pragma mark- TimeHeaderViewDelegate
-(void)logoTimeHeaderViewLeftClicked
{
    LeftViewController * leftView = [[LeftViewController alloc] init];
   
    [self.navigationController pushViewController:leftView animated:YES];

}

-(void)logoTimeHeaderViewRightClicked
{
    RightViewController * rightView = [[RightViewController alloc] init];
   
    [self.navigationController pushViewController:rightView animated:YES];
}

#pragma mark- TimeTableViewCellDelegate
//接口
-(void)TimeCellClickedWithImageView
{
    
}

-(void)btnCliked:(id)sender
{
    
}

@end
