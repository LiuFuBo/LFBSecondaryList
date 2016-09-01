//
//  FriendGroup.h
//  二级列表
//
//  Created by 刘富波 on 16/6/3.
//  Copyright © 2016年 mac1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FriendGroup : NSObject

@property(nonatomic,strong)NSArray *friends;
@property(nonatomic,copy) NSString *name;
@property(nonatomic,assign)NSInteger online;

@property(nonatomic,assign,getter=isOpened) BOOL opened;

+(instancetype)friendGroupWithDict:(NSDictionary *)dict;
-(instancetype)initWithDict:(NSDictionary *)dict;
@end
