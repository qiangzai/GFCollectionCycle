//
//  GFCycleView.m
//  GFCollectionCycle
//
//  Created by  lizhongqiang on 2017/3/22.
//  Copyright © 2017年  lizhongqiang. All rights reserved.
//

#import "GFCycleView.h"
#import "GFCycleCollectionViewCell.h"

@interface GFCycleView ()<UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation GFCycleView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addCollectionView];
    }
    return self;
}

- (void)addCollectionView {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = self.frame.size;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumLineSpacing = 0;
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.pagingEnabled = YES;
    collectionView.backgroundColor = [UIColor clearColor];
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.scrollsToTop = NO;
    [collectionView registerClass:[GFCycleCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self addSubview:collectionView];
    
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    GFCycleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    return cell;
}

@end
