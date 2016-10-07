//
//  VDDisplayView.m
//  VDChainReactionDemo
//
//  Created by 李延博 on 16/10/6.
//  Copyright © 2016年 by. All rights reserved.
//

#import "VDDisplayView.h"
#import "VDDisplayViewCell.h"

#define ItemHeight 300
#define kMainWidth [UIScreen mainScreen].bounds.size.width

@interface VDDisplayView ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, assign) NSInteger itemNumber;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation VDDisplayView

static NSString * const reuseIdentifier = @"Cell";

- (instancetype)initWithItemNumber:(NSInteger)itemNumber {
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(kMainWidth - 110, ItemHeight);
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    if (self = [super initWithFrame:CGRectZero collectionViewLayout:layout]) {
        
        self.frame = CGRectMake(90, 20, kMainWidth - 110, ItemHeight);
        self.scrollEnabled = NO;
        self.itemNumber = itemNumber;
        self.dataSource = self;
        self.delegate = self;
        self.showsHorizontalScrollIndicator = NO;
        [self registerClass:[VDDisplayViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
        
    }
    
    return self;
}



#pragma mark <UICollectionViewDataSource>


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.itemNumber;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    VDDisplayViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}





@end