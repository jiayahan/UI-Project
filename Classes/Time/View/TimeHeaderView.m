//
//  TimeHeaderView.m
//  UI Project
//
//  Created by 中软mini011 on 15/10/12.
//  Copyright (c) 2015年 中软mini011. All rights reserved.
//

#import "TimeHeaderView.h"

#define Header_Height 162

#define Btn1 100
#define Btn2 200

@interface TimeHeaderView ()
{
    UIView * _headerView;
    
    UIImageView * _imageView;
    
    UIButton * _btn1 ;
    
    UIButton * _btn2 ;
    
    UILabel * _Label1;
    
    UILabel * _Label2;
    
    UILabel * _Label3;
}

@end

@implementation TimeHeaderView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        [self initUIHeaderView];
    }
    
    return self;
}

-(void)initUIHeaderView
{
    _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Header_Height)];
    
    _headerView.backgroundColor = [UIColor yellowColor];
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Header_Height)];
    
   _btn1 = [self addButtonTag:Btn1 Rect:CGRectMake(20,Header_Height-50 , 40, 40)];
    
     _btn2 = [self addButtonTag:Btn2 Rect:CGRectMake(CGRectGetMaxX(_btn1.frame)+10,Header_Height-50 , 40, 40)];
    
    _Label1 = [self addLabelText:@"我们在一起" Rect:CGRectMake(Screen_Width-70,Header_Height-50,60,15) Font:12];
    
    _Label2 = [self addLabelText:@"563" Rect:CGRectMake(Screen_Width-72, CGRectGetMaxY(_Label1.frame), 45, 30) Font:25];
    _Label3 =[self addLabelText:@"天" Rect:CGRectMake(CGRectGetMaxX(_Label2.frame),  CGRectGetMaxY(_Label1.frame)+8,20, 20) Font:11];
    
    _imageView.userInteractionEnabled = YES;
    
   [_headerView addSubview:_imageView];
    
    [self addSubview:_headerView];
}


-(UIButton *)addButtonTag:(NSInteger)tag Rect:(CGRect)rect
{
    UIButton * btn = [[UIButton alloc] initWithFrame:rect];

    btn.tag = tag;
    
    btn.backgroundColor = [UIColor redColor];
    
    btn.layer.cornerRadius = 20.0f;
    
    //设置外边框颜色
    btn.layer.borderColor = [UIColor whiteColor].CGColor;
    
    //设置外边框的宽度
    btn.layer.borderWidth = 1.0f;
    
    
    [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [_imageView addSubview:btn];
    
    return btn;
}

-(void)btnClicked:(id)sender
{
    if (sender && [sender isKindOfClass:[UIButton class]])
    {
        UIButton * button = (UIButton *)sender;
        switch (button.tag)
            {
                case Btn1:
                {
                    [_delegate logoTimeHeaderViewLeftClicked];
                }
                    break;
                case Btn2:
                {
                    [_delegate logoTimeHeaderViewRightClicked];
                }
                    break;
                default:
                    break;
            }
        }
}

-(UILabel *)addLabelText:(NSString *)text Rect:(CGRect)rect Font:(CGFloat)font
{
    UILabel * label = [[UILabel alloc] initWithFrame:rect];
    
    label.text = text;
    
    label.font = [UIFont systemFontOfSize:font];
    
    label.backgroundColor = [UIColor clearColor];
    
    label.textColor = [UIColor whiteColor];
    
    label.textAlignment = NSTextAlignmentCenter;
    
    [_imageView addSubview:label];
    
    return label;
}
-(void)updateTimeHeaderViewData
{
    _imageView.image = [UIImage imageNamed:_Data.imageName];
    
    [_btn1 setBackgroundImage:[UIImage imageNamed:_Data.btn1] forState:UIControlStateNormal];
    
    [_btn2 setBackgroundImage:[UIImage imageNamed:_Data.btn2] forState:UIControlStateNormal];
}












/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
