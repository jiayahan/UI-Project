//
//  GameViewController.m
//  UI Project
//
//  Created by 中软mini011 on 15/10/8.
//  Copyright (c) 2015年 中软mini011. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()
{
    NewFuction * _gameBanner;
}

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//     [self initNavigation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self initBanner];
    
    [self initGameView];
    

}

-(void)initNavigation
{
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, -20, Screen_Width, 64)];
    
    view.backgroundColor = [UIColor redColor];
    
    [self.navigationController.navigationBar addSubview:view];

}
-(void)initBanner
{
    NSMutableArray * _gameArray = [NSMutableArray array];
    
    for (int index=1; index<=6; index++)
    {
        NSString * gameString = [[NSString alloc] initWithFormat:@"game_Banner%d.png",index];
        
        [_gameArray addObject:gameString];
    }
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
     _gameBanner = [NewFuction showNewFuction:HWScrollViewTypeBanner ImageArray:_gameArray];
    
    [self.view addSubview:_gameBanner];
}

-(void)initGameView
{
    UIView * gameView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_gameBanner.frame), Screen_Width, Screen_Height-130)];
    gameView.backgroundColor = [UIColor colorWithRed:248/255.0 green:246/255.0 blue:239/255.0 alpha:1];
    
    UIView * homeView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width/3-0.33, 130)];
    homeView.backgroundColor = [UIColor whiteColor];
    UITapGestureRecognizer * tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap1Clicked:)];
    homeView.userInteractionEnabled = YES;
    [homeView addGestureRecognizer:tap1];
    [gameView addSubview:homeView];
    
    UIImageView * homeImageView = [self addUIImageViewRect:CGRectMake(28, 30, 50, 50) ImageName:@"game_home@2x.png"];
    [homeView addSubview:homeImageView];
    
    UILabel * homeLabel = [self addUILabelRect:CGRectMake(0, CGRectGetMaxY(homeImageView.frame)+10, Screen_Width/3-0.33, 16) Text:@"我们的家" Font:14];
    [homeView addSubview:homeLabel];
    
    UIView * loveView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(homeView.frame)+0.5, 0, Screen_Width/3-0.33, 130)];
    loveView.backgroundColor = [UIColor whiteColor];
    UITapGestureRecognizer * tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap2Clicked:)];
    loveView.userInteractionEnabled = YES;
    [loveView addGestureRecognizer:tap2 ];
    [gameView addSubview:loveView];
    
    UIImageView * loveImageView = [self addUIImageViewRect:CGRectMake(28, 30, 50, 50) ImageName:@"game_tree@2x.png"];
    [loveView addSubview:loveImageView];
    
    UILabel * loveLabel = [self addUILabelRect:CGRectMake(0, CGRectGetMaxY(loveImageView.frame)+10, Screen_Width/3-0.33, 16) Text:@"爱情树" Font:14];
    [loveView addSubview:loveLabel];
    
    UIView * kissView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(loveView.frame)+0.5, 0, Screen_Width/3-0.33, 130)];
    kissView.backgroundColor = [UIColor whiteColor];
    UITapGestureRecognizer * tap3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap3Clicked:)];
    kissView.userInteractionEnabled = YES;
    [kissView addGestureRecognizer:tap3 ];
    [gameView addSubview:kissView];
    
    UIImageView * kissImageView = [self addUIImageViewRect:CGRectMake(28, 30, 50, 50) ImageName:@"game_kiss@2x.png"];
    [kissView addSubview:kissImageView];
    
    UILabel * kissLabel = [self addUILabelRect:CGRectMake(0, CGRectGetMaxY(loveImageView.frame)+10, Screen_Width/3-0.33, 16) Text: @"打老公" Font:14];
    [kissView addSubview:kissLabel];

    UIView * popView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(homeView.frame)+0.5, Screen_Width/3-0.33, 130)];
    popView.backgroundColor = [UIColor whiteColor];
    UITapGestureRecognizer * tap4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap4Clicked:)];
    popView.userInteractionEnabled = YES;
    [popView addGestureRecognizer:tap4 ];
    [gameView addSubview:popView];
    
    UIImageView * popImageView = [self addUIImageViewRect:CGRectMake(28, 30, 50, 50) ImageName:@"game_pop@2x.png"];
    [popView addSubview:popImageView];
    
    UILabel * popLabel = [self addUILabelRect:CGRectMake(0, CGRectGetMaxY(popImageView.frame)+10, Screen_Width/3-0.33, 16) Text:@"情侣消消乐" Font:14];
    [popView addSubview:popLabel];
    
    [self.view addSubview:gameView];
}

#pragma mark- addUIView
-(UIView *)addUIViewRect:(CGRect)rect BackGroundColor:(UIColor*)backGroundColor
{
    UIView * view = [[UIView alloc] initWithFrame:rect];
    
    view.backgroundColor = backGroundColor;
    
    return view;
}

#pragma mark- addUIImageView

-(UIImageView*)addUIImageViewRect:(CGRect)rect ImageName:(NSString*)imageName
{
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:rect];
    
    imageView.image = [UIImage imageNamed:imageName];
    
    imageView.backgroundColor = [UIColor clearColor];
    
    return imageView;
}

#pragma mark- addUILabel
-(UILabel*)addUILabelRect:(CGRect)rect Text:(NSString*)text Font:(CGFloat)font
{
    UILabel * label = [[UILabel alloc] initWithFrame:rect];
    
    label.text = text;
    
    label.font = [UIFont systemFontOfSize:font];
    
    label.textAlignment = NSTextAlignmentCenter;
    
    label.textColor = [UIColor grayColor];
    
    return label;
}
-(void)tap1Clicked:(id)sender
{
    NSLog(@"我们的家");
}

-(void)tap2Clicked:(id)sender
{
    NSLog(@"爱情树");
}

-(void)tap3Clicked:(id)sender
{
    NSLog(@"打老公");
}

-(void)tap4Clicked:(id)sender
{
    NSLog(@"情侣消消乐");
}


@end
