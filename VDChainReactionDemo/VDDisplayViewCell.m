//
//  VDDisplayViewCell.m
//  VDChainReactionDemo
//
//  Created by 李延博 on 16/10/6.
//  Copyright © 2016年 by. All rights reserved.
//

#import "VDDisplayViewCell.h"
#import "VDCrosswiseList.h"
#define VDCrossWiseListSize CGSizeMake(self.bounds.size.width, 30)
@interface VDDisplayViewCell ()<UITableViewDelegate,UITableViewDataSource,VDCrosswiseListDelegate>

@property (nonatomic, strong) VDCrosswiseList *headerView;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation VDDisplayViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self.contentView addSubview:self.tableView];
        self.tableView.frame = self.contentView.bounds;
        self.text = @"0";
        self.tableView.tableHeaderView = self.headerView;
        self.tableView.showsVerticalScrollIndicator = NO;
        
    }
    return self;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"acell"];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"acell"];
    }
    
    cell.detailTextLabel.text = self.text;
    cell.backgroundColor = [UIColor grayColor];
    
    return cell;
}


- (void)VDCrosswiseListDidClickItem:(NSIndexPath *)index {
    
    //在此处刷新数据
    
    self.text = [NSString stringWithFormat:@"%zd",index.item];
    
    [self.tableView reloadData];
}


- (VDCrosswiseList *)headerView {
    if (_headerView == nil) {
        
        _headerView = [[VDCrosswiseList alloc] initWithItemNumber:5 Size:VDCrossWiseListSize];
        _headerView.VDCrosswiseListDelegate = self;
    }
    return _headerView;
}



- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]init];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}


@end

