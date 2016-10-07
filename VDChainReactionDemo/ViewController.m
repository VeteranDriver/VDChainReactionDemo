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


#define VerticalListItemWidth 50
#define VerticalListItemNumber 10
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
        
        make.left.top.mas_equalTo(20);
        make.width.mas_equalTo(VerticalListItemWidth);
        make.height.mas_equalTo(VerticalListItemWidth * VerticalListItemNumber);
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
        _displayView = [[VDDisplayView alloc] initWithItemNumber:VerticalListItemNumber];
    }
    return _displayView;
}

@end
