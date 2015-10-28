//
//  LifeSubViewController.m
//  UI Project
//
//  Created by 中软mini011 on 15/10/17.
//  Copyright (c) 2015年 中软mini011. All rights reserved.
//

#import "LifeSubViewController.h"

@interface LifeSubViewController ()

@end

@implementation LifeSubViewController

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
    
    UIImageView * allImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 70, 40, 40)];;
    allImageView.backgroundColor = [UIColor clearColor];
    allImageView.image = [UIImage imageNamed:self.allSubData.frontImageName];
    
    [self.view addSubview:allImageView];
    
    UILabel * AllLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(allImageView.frame)+10,70, 200, 20)];
    AllLabel.text = self.allSubData.label1;
    
    [self.view addSubview:AllLabel];
}
@end
