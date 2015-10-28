//
//  FirstPageViewController.m
//  UI Project
//
//  Created by 中软mini011 on 15/10/8.
//  Copyright (c) 2015年 中软mini011. All rights reserved.
//

#import "FirstPageViewController.h"
#import "setUpViewController.h"


#define P_Button 1000

@interface FirstPageViewController ()<UIActionSheetDelegate>
{
    UIView * _firstPageView;
    
    UIView * _headerView;
    
    UIView * _view1;
    
    UIView * _view2;
    
    UIView * _view3;
    
    UIImageView * _firstPageImageView;
    
    UIImageView * _imageView1;
    
    UIImageView * _imageView2;
    
    UIImageView * _imageView3;
    
    UIImageView * _imageView4;
    
    UIImageView * _leftImageView;
    
    UIImageView * _rightImageView;
    
    UILabel * _label1;
    
    UILabel * _label2;
    
    UILabel * _label3;
    
    UILabel * _label4;

    UILabel * _label5;
    
    UILabel * _leftLabel1;
    
    UILabel * _leftLavel2;
    
    UILabel * _rightLabel1;
    
    UILabel * _rightLabel2;
    
    UIButton * _button;
    
    UIButton * _leftButton;
    
    UIButton * _rightButton;
}

@end

@implementation FirstPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   
     [self navigationBarRightBtn];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self initFirsPagetView];
    
   
    
}

-(void)navigationBarRightBtn
{
   UIImage * image = [[UIImage imageNamed:@"ln_common_settings@2x.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStyleDone target:self action:@selector(RightBtn:)];
}

-(void)RightBtn:(id)sender
{
    setUpViewController * setUp = [[setUpViewController alloc] init];
        
        
    [self.navigationController pushViewController:setUp animated:YES];
}


-(void)initFirsPagetView
{
    _firstPageView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height)];
    _firstPageView.backgroundColor = [UIColor clearColor];
    
    _firstPageImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height)];
    _firstPageImageView.image = [UIImage imageNamed:@"first_back.png"];
    [_firstPageView addSubview:_firstPageImageView];
    
    _headerView = [[UIView alloc] initWithFrame:CGRectMake(0,64, Screen_Width, 53)];
    _headerView.backgroundColor = [UIColor colorWithRed:252/255.0 green:247/255.0 blue:241/255.0 alpha:0.9];
    [_firstPageView addSubview:_headerView];
    
    _leftButton  = [self addUIButtonRect:CGRectMake(15, 9, 35, 35) ImageName:@"left_Button.png"];
    _rightButton = [self addUIButtonRect:CGRectMake(Screen_Width-45, 9, 35, 35) ImageName:@"right_Button.png"];
    [_headerView addSubview:_rightButton];
    
     _leftImageView = [self addUIImageViewRect:CGRectMake(CGRectGetMaxX(_leftButton.frame)+10, 15, 23, 23) ImageName:@"weathericon1@2x.png"];
    [_headerView addSubview:_leftImageView];
    _rightImageView = [self addUIImageViewRect:CGRectMake(Screen_Width-75, 14, 25, 25) ImageName:@"weathericon2@2x.png"];
    [_headerView addSubview:_rightImageView];
    
    _leftLabel1 = [self addUILabelRect:CGRectMake(CGRectGetMaxX(_leftImageView.frame)+6,9,30,17.5) Text:@"大连" Font:13.0f TextAlignment:NSTextAlignmentLeft];
    [_headerView addSubview:_leftLabel1];
     _leftLavel2 = [self addUILabelRect:CGRectMake(CGRectGetMaxX(_leftImageView.frame)+6,CGRectGetMaxY(_leftLabel1.frame), 50, 17.5) Text: @"晴 20°C" Font:13.0f TextAlignment:NSTextAlignmentLeft];
    [_headerView addSubview:_leftLavel2];
    _rightLabel1 = [self addUILabelRect:CGRectMake(Screen_Width-130, 9, 50, 17.5) Text:@"郑州" Font:13 TextAlignment:NSTextAlignmentRight];
    [_headerView addSubview:_rightLabel1];
    _rightLabel2 = [self addUILabelRect:CGRectMake(Screen_Width-136, CGRectGetMaxY(_rightLabel1.frame), 70, 17.5) Text:@"多云 18°C" Font:13 TextAlignment:NSTextAlignmentLeft];
    [_headerView addSubview:_rightLabel2];
    
    _view1 = [self addUIViewRect:CGRectMake(40, Screen_Height-130, 66, 66)];
    UITapGestureRecognizer * tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(view1Clicked:)];
    [_view1 addGestureRecognizer:tap1];
    
    _imageView1 = [self addUIImageViewRect:CGRectMake(0, 0, 66, 66) ImageName:@"cover_center_bg@3x.png"];
    [_view1 addSubview:_imageView1];

    _label1 = [self addUILabelRect:CGRectMake(18, 8, 30, 30) Text:@"6" Font:22 TextAlignment:NSTextAlignmentCenter];
    _label1.textColor = [UIColor redColor];
     [_imageView1 addSubview:_label1];
    
    _label2 = [self addUILabelRect:CGRectMake(13, CGRectGetMaxY(_label1.frame), 40, 15) Text:@"纪念日" Font:11 TextAlignment:NSTextAlignmentCenter];
    _label2.textColor = [UIColor grayColor];
    [_imageView1 addSubview:_label2];
    
    _view2 = [self addUIViewRect:CGRectMake(CGRectGetMaxX(_view1.frame)+30, Screen_Height-130, 66, 66)];
    UITapGestureRecognizer * tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(view2Clicked:)];
    [_view2 addGestureRecognizer:tap2];
    
    _imageView4 = [self addUIImageViewRect:CGRectMake(0, 0, 66, 66) ImageName:@"cover_center_bg@3x.png"];
    [_view2 addSubview:_imageView4];
    _imageView2 = [self addUIImageViewRect:CGRectMake(3, 2.5, 60, 60) ImageName:@"center@2x.png"];
    [_imageView4 addSubview:_imageView2];
    
    _label3 = [self addUILabelRect:CGRectMake(10, 38,40, 15) Text:@"聊天" Font:15 TextAlignment:NSTextAlignmentCenter];
    _label3.textColor = [UIColor whiteColor];
    [_imageView2 addSubview:_label3];
    
    _view3 = [self addUIViewRect:CGRectMake(CGRectGetMaxX(_view2.frame)+30, Screen_Height-130, 66, 66)];
    UITapGestureRecognizer * tap3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(view3Clicked:)];
    [_view3 addGestureRecognizer:tap3];

    _imageView3 = [self addUIImageViewRect:CGRectMake(0, 0, 66, 66) ImageName:@"cover_center_bg@3x.png"];
    [_view3 addSubview:_imageView3];
    
    _label4 = [self addUILabelRect:CGRectMake(18, 8, 30, 30) Text:@"0" Font:22 TextAlignment:NSTextAlignmentCenter];
    _label4.textColor = [UIColor colorWithRed:229/255.0 green:152/255.0 blue:78/255.0 alpha:1];
    [_imageView3 addSubview:_label4];
    
    _label5 = [self addUILabelRect:CGRectMake(13, CGRectGetMaxY(_label1.frame), 50, 15) Text:@"情侣愿望" Font:11 TextAlignment:NSTextAlignmentLeft];
    _label5.textColor = [UIColor grayColor];
    [_imageView3 addSubview:_label5];
    
    _button = [[UIButton alloc] initWithFrame:CGRectMake(Screen_Width-35,CGRectGetMaxY(_headerView.frame)+10, 25, 25)];
    _button.tag = P_Button;
    _button.backgroundColor = [UIColor clearColor];
    [_button setBackgroundImage:[UIImage imageNamed:@"button.png"] forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [_firstPageView addSubview:_button];
    
    [self.view addSubview:_firstPageView];
}

#pragma mark- addUIButton
-(UIButton *)addUIButtonRect:(CGRect)rect ImageName:(NSString *)imageName
{
    UIButton * btn = [[UIButton alloc] initWithFrame:rect];
    
    [btn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    
    btn.layer.cornerRadius = 20.0f;
    
    btn.backgroundColor = [UIColor clearColor];
    
    [_headerView addSubview:btn];
    
    return btn;
}

#pragma mark- addUIImageView
-(UIImageView *)addUIImageViewRect:(CGRect)rect ImageName:(NSString *)imageName
{
    UIImageView * iv = [[UIImageView alloc] initWithFrame:rect];
    
    iv.image = [UIImage imageNamed:imageName];
    
    return iv;
}

#pragma mark- addUILabel
-(UILabel *)addUILabelRect:(CGRect)rect Text:(NSString *)text Font:(CGFloat)font TextAlignment:(NSTextAlignment)textAlignment
{
    UILabel * lab = [[UILabel alloc] initWithFrame:rect];
    
    lab.text = text;
    
    lab.font = [UIFont systemFontOfSize:font];
    
    lab.textAlignment = textAlignment;

    return lab;
}

#pragma mark- addUIView
-(UIView *)addUIViewRect:(CGRect)rect
{
    UIView * view = [[UIView alloc] initWithFrame:rect];
    
    view.backgroundColor = [UIColor clearColor];
    
    view.userInteractionEnabled = YES;
    
    [_firstPageView addSubview:view];
    
    return view;
}

-(void)view1Clicked:(id)sender
{
    NSLog(@"纪念日");
}


-(void)view2Clicked:(id)sender
{
    NSLog(@"聊天");
}

-(void)view3Clicked:(id)sender
{
    NSLog(@"情侣愿望");
}

-(void)buttonClicked:(id)sender
{
    if (sender && [sender isKindOfClass:[UIButton class]])
    {
        UIActionSheet * actionSheet = [[UIActionSheet alloc] initWithTitle:@"选择操作" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍摄照片",@"从照片中选取",@"恢复默认", nil];
        
        [actionSheet showInView:self.view];
    }
}

#pragma mark- UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex)
    {
        case 0:
        {
            NSLog(@"拍摄照片");
        }
            break;
        case 1:
        {
            NSLog(@"从相册中选取");
        }
            break;
        case 2:
        {
            NSLog(@"恢复默认");
        }
        default:
            break;
    }
}
@end
