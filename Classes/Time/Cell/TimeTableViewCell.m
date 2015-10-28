//
//  TimeTableViewCell.m
//  UI Project
//
//  Created by 中软mini011 on 15/10/12.
//  Copyright (c) 2015年 中软mini011. All rights reserved.
//

#import "TimeTableViewCell.h"

@interface TimeTableViewCell ()
{
    
}

@end

@implementation TimeTableViewCell


//重写initWithStyle
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self iniUI];
    }
    
    return self;
}

-(void)iniUI
{
    //构建UI元素
    UIView * bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,Screen_Width , 240)];
    
    bgView.backgroundColor = [UIColor clearColor];
    
    //把ui元素放到contentView
    [self.contentView addSubview:bgView];
    
    UIView * sview = [[UIView alloc] initWithFrame:CGRectMake(40, 0, 4, Screen_Height)];
    
    sview.backgroundColor = [UIColor colorWithRed:233/255.0 green:231/255.0 blue:224/255.0 alpha:1];
    
    
    [bgView addSubview:sview];
    
}


//更新接口
-(void)updataTimeCell
{
    
}













- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
