//
//  LifeTableViewCell.h
//  UI Project
//
//  Created by 中软mini011 on 15/10/10.
//  Copyright (c) 2015年 中软mini011. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LifeTableViewCellData.h"

@protocol LifeTableviewCellDelegate <NSObject>

-(void)LifeCellClickedWithImageView;

@optional
-(void)btnClicked:(id)sender;

@end

@interface LifeTableViewCell : UITableViewCell

@property(nonatomic,strong)LifeTableViewCellData * Data;

@property(nonatomic,weak)id<LifeTableviewCellDelegate>delegate;


//更新数据接口
-(void)updateLifeCell;

@end
