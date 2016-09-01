//
//  ViewController.m
//  二级列表
//
//  Created by 刘富波 on 16/6/2.
//  Copyright © 2016年 mac1. All rights reserved.
//

#import "ViewController.h"
#import "FriendGroup.h"
#import "Friend.h"
#import "HeaderView.h"


static NSString *const cellIdentifier = @"cellIdentifier";
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,HeadViewDelegate>{

    NSArray *_friendsData;
}
@property(nonatomic,strong)UITableView *tableView;
-(void)initilizeAppeareces;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initilizeAppeareces];
}

-(void)initilizeAppeareces{

    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"好友列表";
    [self.view addSubview:self.tableView];
    self.tableView.sectionHeaderHeight = 40;
    [self loadData];

}
#pragma mark -加载数据
-(void)loadData{

    NSURL *url = [[NSBundle mainBundle]URLForResource:@"friends.plist" withExtension:nil];
    NSArray *tempArray = [NSArray arrayWithContentsOfURL:url];
    NSMutableArray *fgArray = [NSMutableArray array];
    for (NSDictionary *dict in tempArray) {
        FriendGroup *friendGroup = [FriendGroup friendGroupWithDict:dict];
        [fgArray addObject:friendGroup];
    }
    _friendsData = fgArray;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return _friendsData.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    FriendGroup *friendGroup = _friendsData[section];
    NSInteger count = friendGroup.isOpened ? friendGroup.friends.count : 0;
    return count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    FriendGroup *friendGroup = _friendsData[indexPath.section];
    Friend *friend = friendGroup.friends[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:friend.icon];
    cell.textLabel.textColor = friend.isVip ? [UIColor redColor] :[UIColor blackColor];
    cell.textLabel.text = friend.name;
    cell.detailTextLabel.text = friend.intro;
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    HeaderView *headView = [HeaderView headViewWithTableView:tableView];
    headView.delegate = self;
    headView.friendGroup = _friendsData[section];
    return headView;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    return;
}

-(void)clickHeadView{

    [self.tableView reloadData];
}

-(UITableView *)tableView{
    return _tableView?:({
        _tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.tableFooterView = [UIView new];
        _tableView;
    });
}

@end
