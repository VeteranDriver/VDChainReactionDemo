//
//  VDVerticalList.h
//  VDChainReactionDemo
//
//  Created by 李延博 on 16/10/6.
//  Copyright © 2016年 by. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol VDVerticalListDelegate <NSObject>

- (void)VDVerticalListDidClickItem:(NSIndexPath *)index;

@end

@interface VDVerticalList : UICollectionView

@property (nonatomic, weak) id<VDVerticalListDelegate> VDVerticalListDelegate;


- (instancetype)initWithItemNumber:(NSInteger)itemNumber;

@end
