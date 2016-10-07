//
//  VDCrosswiseList.m
//  VDChainReactionDemo
//
//  Created by 李延博 on 16/10/6.
//  Copyright © 2016年 by. All rights reserved.
//

#import "VDCrosswiseList.h"

#define ItemHeight 30
#define kMainWidth [UIScreen mainScreen].bounds.size.width
@interface VDCrosswiseList ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, assign) NSInteger itemNumber;

@end

@implementation VDCrosswiseList

static NSString * const reuseIdentifier = @"Cell";

- (instancetype)initWithItemNumber:(NSInteger)itemNumber {
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake((kMainWidth - 110) / itemNumber, ItemHeight);
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    if (self = [super initWithFrame:CGRectZero collectionViewLayout:layout]) {
        
        self.frame = CGRectMake(0, 0, kMainWidth - 110, ItemHeight);
        self.itemNumber = itemNumber;
        self.dataSource = self;
        self.delegate = self;
        [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    }
    
    return self;
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.itemNumber;
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.backgroundColor = indexPath.item % 2 ? [UIColor yellowColor] : [UIColor greenColor];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([self.VDCrosswiseListDelegate respondsToSelector:@selector(VDCrosswiseListDidClickItem:)]) {
        
        [self.VDCrosswiseListDelegate VDCrosswiseListDidClickItem:indexPath];
    }
    
}
@end

