//
//  RightViewController.m
//  UI Project
//
//  Created by 中软mini011 on 15/10/12.
//  Copyright (c) 2015年 中软mini011. All rights reserved.
//

#import "RightViewController.h"

@interface RightViewController ()

@end

@implementation RightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self initUI];
}

-(void)initUI
{
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height)];
    
    view.backgroundColor = [UIColor whiteColor];
    
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, Screen_Height/2-150, Screen_Width, 300)];
    
    imageView.image = [UIImage imageNamed:@"22.png"];
    
    [view addSubview:imageView];
    
    [self.view addSubview:view];
}
@end
