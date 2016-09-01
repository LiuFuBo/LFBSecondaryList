//
//  HeaderView.h
//  二级列表
//
//  Created by 刘富波 on 16/6/7.
//  Copyright © 2016年 mac1. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FriendGroup;
@protocol HeadViewDelegate <NSObject>

@optional

-(void)clickHeadView;

@end

@interface HeaderView : UITableViewHeaderFooterView

@property(nonatomic,strong) FriendGroup *friendGroup;

@property(nonatomic,weak) id<HeadViewDelegate>delegate;

+(instancetype)headViewWithTableView:(UITableView *)tableView;

@end
