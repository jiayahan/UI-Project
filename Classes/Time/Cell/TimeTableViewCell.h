//
//  TimeTableViewCell.h
//  UI Project
//
//  Created by 中软mini011 on 15/10/12.
//  Copyright (c) 2015年 中软mini011. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TimeTableViewData.h"

@protocol TimeTableViewCellDelegate <NSObject>

@required

//接口
-(void)TimeCellClickedWithImageView;

@optional

-(void)btnCliked:(id)sender;

@end

@interface TimeTableViewCell : UITableViewCell

@property(nonatomic,strong)TimeTableViewData * data;

@property(nonatomic,weak)id<TimeTableViewCellDelegate>delegate;

-(void)updataTimeCell;

@end
