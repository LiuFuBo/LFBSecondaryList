//
//  Friend.m
//  二级列表
//
//  Created by 刘富波 on 16/6/3.
//  Copyright © 2016年 mac1. All rights reserved.
//

#import "Friend.h"

@implementation Friend

+(instancetype)friendWithDict:(NSDictionary *)dict{

    return [[self alloc]initWithDict:dict];
}

-(instancetype)initWithDict:(NSDictionary *)dict{

    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

@end
