//
//  CZNewFeatureCell.m
//  MicroBlog
//
//  Created by 小白 on 15/10/30.
//  Copyright (c) 2015年 小白. All rights reserved.
//

#import "CZNewFeatureCell.h"

@interface CZNewFeatureCell ()
@property (nonatomic,strong)UIImageView *imageView;
@end

@implementation CZNewFeatureCell

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.frame = self.bounds;
}


-(void)setImage:(NSString *)image
{
    _image = image;
    self.imageView = [[UIImageView alloc] init];
    self.imageView.image = [UIImage imageNamed:_image];
    [self.contentView addSubview:self.imageView];

}

@end
