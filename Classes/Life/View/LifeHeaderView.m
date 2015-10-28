//
//  LifeHeaderView.m
//  UI Project
//
//  Created by 中软mini011 on 15/10/10.
//  Copyright (c) 2015年 中软mini011. All rights reserved.
//

#import "LifeHeaderView.h"

//#define Talk_Button 222
//#define Funny_Button 333
@interface LifeHeaderView ()
{
    UIView * _headerView;
    
    UIView * _view1;
    
    UIButton * _talk;
    
    UIButton * _funny;
}

@end

@implementation LifeHeaderView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        [self initHeaderView];
    }
    
    return self;
}

-(void)initHeaderView
{
    _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 234)];
    
    _headerView.backgroundColor = [UIColor clearColor];
    
   _view1= [[UIView alloc] initWithFrame:CGRectMake(0, 194, Screen_Width, 40)];
    
    _view1.backgroundColor = [UIColor redColor];
    
    [_headerView addSubview:_view1];
    
    _talk = [self addButtonTag:Talk_Button Rect:CGRectMake(0,0,Screen_Width/2,37) ];
    
    _funny =[self addButtonTag:Funny_Button Rect:CGRectMake(Screen_Width/2,0,Screen_Width/2,40)];
    
    [self addSubview:_headerView];
}


-(void)bClicked:(id)sender
{
    if(sender && [sender isKindOfClass:[UIButton class]])
    {
        UIButton * bt = (UIButton *)sender;
        switch (bt.tag)
            {
                case Talk_Button:
                {
                    [_talk removeFromSuperview];
                  
                    _talk=nil;

                    _talk = [self addButtonTag:Talk_Button Rect:CGRectMake(0,0,Screen_Width/2,37) ];
                    
                    _talk.frame=CGRectMake(0,0,Screen_Width/2,37);
                    
                    [_funny removeFromSuperview];
                    
                    _funny=nil;
                    
                    _funny =[self addButtonTag:Funny_Button Rect:CGRectMake(Screen_Width/2,0,Screen_Width/2,40)];
                    
                    [self updateLifeHeaderViewData];
                    
                    if (_delegate && [_delegate respondsToSelector:@selector(logoLifeHeaderViewClicked:)])
                    {
                        [_delegate logoLifeHeaderViewClicked:sender];
                    }


                }
                    break;
                case Funny_Button:
                {
                    [_talk removeFromSuperview];
                    
                    _talk=nil;
                    
                    _talk = [self addButtonTag:Talk_Button Rect:CGRectMake(0,0,Screen_Width/2,40) ];
                    
                    [_funny removeFromSuperview];
                    
                     _funny=nil;

                    _funny =[self addButtonTag:Funny_Button Rect:CGRectMake(Screen_Width/2,0,Screen_Width/2,37)];
                    [self updateLifeHeaderViewData];
                    
                    if (_delegate && [_delegate respondsToSelector:@selector(logoLifeHeaderViewClicked:)])
                    {
                        [_delegate logoLifeHeaderViewClicked:sender];
                    }

                }
                    break;
                default:
                    break;
            
            
            }
    }
}

-(UIButton *)addButtonTag:(NSInteger)tag Rect:(CGRect)rect
{
    UIButton * b = [[UIButton alloc] initWithFrame:rect];
    
    b.tag = tag;
    
    b.backgroundColor = [UIColor whiteColor];
    
    [b setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    [b addTarget:self action:@selector(bClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [_view1 addSubview:b];
    
    return b;
}

-(void)updateLifeHeaderViewData
{
    [_talk setTitle:_Data.talkName forState:UIControlStateNormal];
    
    [_funny setTitle:_Data.funnyName forState:UIControlStateNormal];
}
@end
