//
//  TabBarController.m
//  UI Project
//
//  Created by 中软mini011 on 15/10/7.
//  Copyright (c) 2015年 中软mini011. All rights reserved.
//

#import "TabBarController.h"

#import "FirstPageViewController.h"
#import "TimeViewController.h"
#import "LifeViewController.h"
#import "GameViewController.h"

#import "NavigationController.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self setUpAllChildViewController];
    
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//添加所有控制器的方法
-(void)setUpAllChildViewController
{
    //添加第一个页面
    FirstPageViewController * firstPage = [[FirstPageViewController alloc]init];
    
    [self setUpOneChildViewController:firstPage Title1:@"首页" Title2:@"微爱" ImageName:@"ln_tab_1@2x.png" SelectImageName:@"ln_tab_1s@2x.png"];
    
    TimeViewController * time = [[TimeViewController alloc] init];
    
    [self setUpOneChildViewController:time Title1:@"时光" Title2:@"微爱时光" ImageName:@"ln_tab_2@2x.png" SelectImageName:@"ln_tab_2s@2x.png"];

    
    LifeViewController * life = [[LifeViewController alloc] init];
    
    [self setUpOneChildViewController:life Title1:@"生活" Title2:@"情侣生活" ImageName:@"ln_tab_3@2x.png" SelectImageName:@"ln_tab_3s@2x.png"];

    
    GameViewController * game = [[GameViewController alloc] init];
    
    [self setUpOneChildViewController:game Title1:@"游戏" Title2:@"情侣游戏" ImageName:@"ln_tab_4@2x.png" SelectImageName:@"ln_tab_4s@2x.png"];
    
    
}

//添加一个控制器的方法
-(void)setUpOneChildViewController:(UIViewController *)viewController Title1:(NSString *)title1 Title2:(NSString *)title2 ImageName:(NSString *)imageName SelectImageName:(NSString *)selectImageName
{
    NavigationController * nav = [[NavigationController alloc] initWithRootViewController:viewController];
    
    nav.title = title1;
    
    nav.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    nav.tabBarItem.selectedImage = [[UIImage imageNamed:selectImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    viewController.navigationItem.title = title2;
    
    
    [self addChildViewController:nav];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
