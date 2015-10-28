//
//  NavigationController.m
//  UI Project
//
//  Created by 中软mini011 on 15/10/7.
//  Copyright (c) 2015年 中软mini011. All rights reserved.
//

#import "NavigationController.h"

@interface NavigationController ()

@end

@implementation NavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//                [self initNavigation];
//    self.navigationController.navigationBarHidden = YES;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
}

//-(void)initNavigation
//{
//    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, -20, Screen_Width, 64)];
//    
//    view.backgroundColor = [UIColor colorWithRed:203/255.0f green:52/255.0f blue:33/255.0f alpha:1];
//    
//    [self.navigationBar addSubview:view];
//}

//添加左右button
-(void)initNavigationBar:(UIViewController * )viewController
{
    //整体

    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:203/255.0f green:52/255.0f blue:33/255.0f alpha:1]];
    //整体
//    [[UINavigationBar appearance] setBarTintColor:[UIColor redColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName, nil]];
    
    if (self.viewControllers.count > 0)
    {
        //在压栈的时候判断如果是二级界面，就把Tabbar隐藏
        viewController.hidesBottomBarWhenPushed = YES;
  
       viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(topBtn:)];
        
       viewController.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];

        //添加右button，用文字表示
       // viewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"顶层" style:UIBarButtonItemStyleDone target:self action:@selector(topBtn:)];

    }
}


-(void)backBtn:(id)sender
{
    //出栈
    [self popViewControllerAnimated:YES];
}

-(void)topBtn:(id)sender
{
    [self popToRootViewControllerAnimated:YES];
}

//压栈方法
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //压栈之前调用方法
    [self initNavigationBar:viewController];
    
    //后压栈
    [super pushViewController:viewController animated:YES];
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
