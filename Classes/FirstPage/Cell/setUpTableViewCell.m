//
//  setUpTableViewCell.m
//  UI Project
//
//  Created by 中软mini011 on 15/10/14.
//  Copyright (c) 2015年 中软mini011. All rights reserved.
//

#import "setUpTableViewCell.h"

@interface setUpTableViewCell ()
{
    UIView * _bgview;
    
    UIImageView * _imageView;
    
    UILabel * _label;
}

@end


@implementation setUpTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        
        [self initUI];
    }
    
    return self;
}


-(void)initUI
{
    _bgview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 45)];
    
    [self.contentView addSubview: _bgview];
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 9, 27, 27)];
    
    [_bgview addSubview:_imageView];
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_imageView.frame)+15, 9, 200, 27)];
    
    _label.font = [UIFont systemFontOfSize:15];
    
    [_bgview addSubview:_label];
    
}

//更新接口
-(void)updateSetUpCell
{
    _imageView.image = [UIImage imageNamed:_Data.imageViewName];
    
    _label.text = _Data.labelName;
}









- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
