//
//  LifeTableViewCell.m
//  UI Project
//
//  Created by 中软mini011 on 15/10/10.
//  Copyright (c) 2015年 中软mini011. All rights reserved.
//

#import "LifeTableViewCell.h"

@interface LifeTableViewCell()
{
    UIView * bgView;
    
    UIImageView * _frontImageView;
    
    UILabel * _label1 ;
    
    UILabel * _label2;
    
    UILabel * _label3;
    
    UILabel * _label4;
}

@end

@implementation LifeTableViewCell

//重写
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        //CELL的风格
        self.selectionStyle = UITableViewCellSelectionStyleGray;
        
        [self initUI];
    }
    
    return self;
}

-(void)initUI
{
    //构建ui元素
    bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 55)];
    
    bgView.backgroundColor = [UIColor whiteColor];
    
    //把uiview放到contentView上
    [self.contentView addSubview:bgView];
    
    _frontImageView = [self addUIImageViewRect:CGRectMake(12, 7.5, 40,40 )];
    
    _label1 = [self addUILabelRect:CGRectMake(CGRectGetMaxX(_frontImageView.frame)+10, 10, 150, 18) Font:15 TextColor:[UIColor blackColor]];
    
    _label2 = [self addUILabelRect:CGRectMake(CGRectGetMaxX(_frontImageView.frame)+10, CGRectGetMaxY(_label1.frame)+5, 170, 15) Font:12 TextColor:[UIColor grayColor]];
    
    _label3 = [self addUILabelRect:CGRectMake(CGRectGetMaxX(_label2.frame)+10, CGRectGetMaxY(_label1.frame)-10, 33, 20) Font:11 TextColor:[UIColor redColor]];
    
    _label4 = [self addUILabelRect:CGRectMake(CGRectGetMaxX(_label3.frame)-5, CGRectGetMaxY(_label1.frame)-10, 32, 20) Font:11 TextColor:[UIColor grayColor]];
    
}

-(UIImageView *)addUIImageViewRect:(CGRect)rect
{
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:rect];
    
    imageView.backgroundColor = [UIColor clearColor];
    
    [bgView addSubview:imageView];
    
    return imageView;
}

-(UILabel *)addUILabelRect:(CGRect)rect Font:(CGFloat)font TextColor:(UIColor *)color
{
    UILabel * label = [[UILabel alloc] initWithFrame:rect];
    
    label.backgroundColor = [UIColor clearColor];
    
    label.textColor = color;
    
    label.font = [UIFont systemFontOfSize:font];
    
    [bgView addSubview:label];
    
    return label;
}

-(void)updateLifeCell
{
    _frontImageView.image = [UIImage imageNamed:_Data.frontImageName];
    
    _label1.text = _Data.label1;
    
    _label2.text = _Data.label2;
    
    _label3.text = _Data.label3;
    
    _label4.text = _Data.label4;
}













- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
