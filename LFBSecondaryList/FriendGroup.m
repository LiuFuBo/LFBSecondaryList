//
//  FriendGroup.m
//  二级列表
//
//  Created by 刘富波 on 16/6/3.
//  Copyright © 2016年 mac1. All rights reserved.
//

#import "FriendGroup.h"
#import "Friend.h"

@implementation FriendGroup

+(instancetype)friendGroupWithDict:(NSDictionary *)dict{

    return [[self alloc] initWithDict:dict];
}

-(instancetype)initWithDict:(NSDictionary *)dict{

    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        NSMutableArray *tempArray = [NSMutableArray array];
        for (NSDictionary *dict in self.friends) {
            Friend *friend = [Friend friendWithDict:dict];
            [tempArray addObject:friend];
        }
        _friends = tempArray;
        
    }
    return self;
}
@end
