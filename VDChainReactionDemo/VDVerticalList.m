//
//  VDVerticalList.m
//  VDChainReactionDemo
//
//  Created by 李延博 on 16/10/6.
//  Copyright © 2016年 by. All rights reserved.
//

#import "VDVerticalList.h"

@interface VDVerticalList ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, assign) NSInteger itemNumber;

@end

@implementation VDVerticalList

static NSString * const reuseIdentifier = @"VDVerticalListCell";


- (instancetype)initWithItemNumber:(NSInteger)itemNumber ItemWidth:(CGFloat)itemWidth {
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(itemWidth, itemWidth);
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    if (self = [super initWithFrame:CGRectZero collectionViewLayout:layout]) {
        
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
    
    cell.backgroundColor = indexPath.item % 2 ? [UIColor redColor] : [UIColor blueColor];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([self.VDVerticalListDelegate respondsToSelector:@selector(VDVerticalListDidClickItem:)]) {
        
        [self.VDVerticalListDelegate VDVerticalListDidClickItem:indexPath];
    }
    
}



@end

