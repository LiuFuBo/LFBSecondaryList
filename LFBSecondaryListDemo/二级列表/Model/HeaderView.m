//
//  HeaderView.m
//  二级列表
//
//  Created by 刘富波 on 16/6/7.
//  Copyright © 2016年 mac1. All rights reserved.
//

#import "HeaderView.h"
#import "FriendGroup.h"

@interface HeaderView (){

    UIButton *_bgButton;
    UILabel *_numLable;
}

@end

@implementation HeaderView

+(instancetype)headViewWithTableView:(UITableView *)tableView{
    static NSString *headIdentifier = @"header";
    HeaderView *headView;
    if (headView == nil) {
        headView = [[HeaderView alloc]initWithReuseIdentifier:headIdentifier];
    }
    return headView;
}

-(id)initWithReuseIdentifier:(NSString *)reuseIdentifier{

    if(self = [super initWithReuseIdentifier:reuseIdentifier]){
    
        UIButton *headButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [headButton setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg"] forState:UIControlStateNormal];
        [headButton setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg_highlighted"] forState:UIControlStateHighlighted];
        [headButton setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
        [headButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //设置imageview的contentmodel
        headButton.imageView.contentMode = UIViewContentModeCenter;
        //???
        headButton.imageView.clipsToBounds = NO;
        headButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        headButton.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        headButton.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        [headButton addTarget:self action:@selector(headButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:headButton];
        _bgButton = headButton;

        
        UILabel *numLabel = [[UILabel alloc]init];
        numLabel.textAlignment = NSTextAlignmentRight;
        [self addSubview:numLabel];
        _numLable = numLabel;
    }
    return self;

}

-(void)headButtonClick{

    _friendGroup.opened = !_friendGroup.isOpened;
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickHeadView)]) {
        [self.delegate clickHeadView];
    }
}

-(void)setFriendGroup:(FriendGroup *)friendGroup{

    _friendGroup =friendGroup;
    [_bgButton setTitle:friendGroup.name forState:UIControlStateNormal];
    _numLable.text = [NSString stringWithFormat:@"%ld/%ld",(long)friendGroup.online,(long)friendGroup.friends.count];
}

-(void)didMoveToSuperview{

    _bgButton.imageView.transform = _friendGroup.isOpened ? CGAffineTransformMakeRotation(M_PI_2):CGAffineTransformMakeRotation(0);
    _bgButton.backgroundColor = _friendGroup.isOpened ?[UIColor redColor]:[UIColor whiteColor];
}

-(void)layoutSubviews{

    [super layoutSubviews];
    _bgButton.frame = self.bounds;
    _numLable.frame = CGRectMake(self.frame.size.width-70, 0, 60, self.frame.size.height);

}




























@end
