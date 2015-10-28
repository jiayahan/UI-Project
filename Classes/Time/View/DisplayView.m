//
//  DisplayView.m
//  UI Project
//
//  Created by 中软mini011 on 15/10/15.
//  Copyright (c) 2015年 中软mini011. All rights reserved.
//

#import "DisplayView.h"

@interface DisplayView ()
{
    UIView * _view;
}

@end

@implementation DisplayView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        [self initUI];
    }
    
    return self;
}

-(void)initUI
{
    _view = [[UIView alloc] initWithFrame:CGRectMake(0, 64, Screen_Width, Screen_Height-64)];
    _view.backgroundColor = [UIColor colorWithRed:244/255.0 green:242/255.0 blue:235/255.0 alpha:1];
    
    [self addSubview:_view];
}
@end
