//
//  setUpTableViewCell.h
//  UI Project
//
//  Created by 中软mini011 on 15/10/14.
//  Copyright (c) 2015年 中软mini011. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "setUpTableViewData.h"

@protocol setUpTableViewDelegate <NSObject>

-(void)setUpCellClikedWithImageView;

@end



@interface setUpTableViewCell : UITableViewCell

@property(nonatomic,weak)id<setUpTableViewDelegate>delegate;

@property(nonatomic,strong)setUpTableViewData * Data;

//更新接口
-(void)updateSetUpCell;

@end
