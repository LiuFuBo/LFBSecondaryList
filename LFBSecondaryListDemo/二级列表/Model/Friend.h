//
//  Friend.h
//  二级列表
//
//  Created by 刘富波 on 16/6/3.
//  Copyright © 2016年 mac1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Friend : NSObject

@property(nonatomic,copy) NSString *icon;
@property(nonatomic,copy) NSString *intro;
@property(nonatomic,copy) NSString *name;
@property(nonatomic,assign,getter=isVip)BOOL vip;


+(instancetype)friendWithDict:(NSDictionary *)dict;
-(instancetype)initWithDict:(NSDictionary *)dict;



@end
