//
//  VDCrosswiseList.h
//  VDChainReactionDemo
//
//  Created by 李延博 on 16/10/6.
//  Copyright © 2016年 by. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol VDCrosswiseListDelegate <NSObject>

- (void)VDCrosswiseListDidClickItem:(NSIndexPath *)index;

@end

@interface VDCrosswiseList : UICollectionView

@property (nonatomic, weak) id<VDCrosswiseListDelegate> VDCrosswiseListDelegate;

- (instancetype)initWithItemNumber:(NSInteger)itemNumber Size:(CGSize)size;

@end

