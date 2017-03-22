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

@property (nonatomic, strong) NSArray *colorArr;
@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation GFCycleView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.colorArr = @[[UIColor redColor],[UIColor blueColor],[UIColor greenColor]];
        
        [self addCollectionView];
    }
    return self;
}

- (void)addCollectionView {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = self.frame.size;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumLineSpacing = 0;
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.scrollsToTop = NO;
    [self.collectionView registerClass:[GFCycleCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self addSubview:self.collectionView];
    NSIndexPath *defIndexPath = [NSIndexPath indexPathForItem:0 inSection:1];
    [self.collectionView scrollToItemAtIndexPath:defIndexPath atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
    
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.colorArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    GFCycleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.imageView.backgroundColor = self.colorArr[indexPath.row];
    return cell;
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"BBBBBB");
    NSIndexPath *currentIndexPath = [[self.collectionView indexPathsForVisibleItems] lastObject];
    NSInteger nextItem = currentIndexPath.item;
    NSInteger nextSection = currentIndexPath.section;
    
    if (nextSection != 1) {
        nextSection = 1;
        NSIndexPath *nextIndexPath = [NSIndexPath indexPathForItem:nextItem inSection:nextSection];
        [self.collectionView scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
    }
    
}



@end
