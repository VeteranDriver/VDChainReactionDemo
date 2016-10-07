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

- (void)VDVerticalListDidClickItem:(NSIndexPath *)index {
    
    [self.displayView scrollToItemAtIndexPath:index atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    
}


- (VDVerticalList *)verticalList{
    
    if (_verticalList == nil) {
        _verticalList = [[VDVerticalList alloc] initWithItemNumber:10];
        _verticalList.VDVerticalListDelegate = self;
    }
    return _verticalList;
}

- (VDDisplayView *)displayView{
    
    if (_displayView == nil) {
        _displayView = [[VDDisplayView alloc] initWithItemNumber:10];
    }
    return _displayView;
}

@end
