//
//  ViewController.m
//  VDChainReactionDemo
//
//  Created by 李延博 on 16/10/6.
//  Copyright © 2016年 by. All rights reserved.
//

#import "ViewController.h"
#import "VDVerticalList.h"
#import "VDDisplayView.h"
#import "Masonry.h"

#define KMargin 20
#define VerticalListItemWidth 50
#define VerticalListItemNumber 10
#define KMainScreenWidth [UIScreen mainScreen].bounds.size.width
#define KMainScreenHeight [UIScreen mainScreen].bounds.size.height
@interface ViewController ()<VDVerticalListDelegate>

@property (nonatomic,strong) VDDisplayView *displayView;
@property (nonatomic,strong) VDVerticalList *verticalList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.displayView];
    [self.view addSubview:self.verticalList];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.verticalList mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.top.mas_equalTo(KMargin);
        make.width.mas_equalTo(VerticalListItemWidth);
        make.height.mas_equalTo(VerticalListItemWidth * VerticalListItemNumber);
    }];
    
    [self.displayView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(KMargin);
        make.left.mas_equalTo(self.verticalList.mas_right).offset(20);
        make.right.mas_equalTo(-KMargin);
        make.bottom.mas_equalTo(-KMargin);
    }];
}

#pragma mark VDVerticalListDelegate

- (void)VDVerticalListDidClickItem:(NSIndexPath *)index {
    
    [self.displayView scrollToItemAtIndexPath:index atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    
}

#pragma mark lazy

- (VDVerticalList *)verticalList{
    
    if (_verticalList == nil) {
        _verticalList = [[VDVerticalList alloc] initWithItemNumber:VerticalListItemNumber ItemWidth:VerticalListItemWidth];
        _verticalList.VDVerticalListDelegate = self;
    }
    return _verticalList;
}

- (VDDisplayView *)displayView{
    
    if (_displayView == nil) {
        _displayView = [[VDDisplayView alloc] initWithItemNumber:VerticalListItemNumber ItemSize:CGSizeMake(KMainScreenWidth - VerticalListItemWidth - KMargin * 3, KMainScreenHeight - KMargin * 2)];
    }
    return _displayView;
}

@end
