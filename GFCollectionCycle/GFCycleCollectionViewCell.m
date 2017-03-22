//
//  GFCycleCollectionViewCell.m
//  GFCollectionCycle
//
//  Created by  lizhongqiang on 2017/3/22.
//  Copyright © 2017年  lizhongqiang. All rights reserved.
//

#import "GFCycleCollectionViewCell.h"

@implementation GFCycleCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self.contentView addSubview:self.imageView];
        self.imageView.frame = frame;
    }
    return self;
}

#pragma mark - setter and getter
- (UIImageView *)imageView {
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}



@end
