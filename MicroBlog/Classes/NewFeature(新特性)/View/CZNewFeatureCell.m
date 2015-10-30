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
@property (nonatomic,weak)UIButton *shareButton;
@property (nonatomic,weak)UIButton *startButton;
@end

@implementation CZNewFeatureCell

-(UIButton *)shareButton
{
    if (_shareButton == nil) {
        _shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_shareButton setTitle:@"快点我" forState:UIControlStateNormal];
        [_shareButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_shareButton setImage:[UIImage imageNamed:@"new_feature_share_false"] forState:UIControlStateNormal];
        [_shareButton setImage:[UIImage imageNamed:@"new_feature_share_true"] forState:UIControlStateSelected];
        [_shareButton sizeToFit];
        [self.contentView addSubview:_shareButton];
    }
    
    return _shareButton;
}

-(UIButton *)startButton
{
    if (_startButton == nil) {
        UIButton *startButton = [UIButton buttonWithType:UIButtonTypeCustom];
      
        [startButton setTitle:@"开始微博" forState:UIControlStateNormal];
        //这句代码写成了setImage，然后调试调了半天，其实是这样的，如果是backgroundImage那么文字会显示到图片之上，如果是image的话就是在图片旁边
        [startButton setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button"] forState:UIControlStateNormal];
        [startButton setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
        [startButton sizeToFit];
        [startButton addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
        [self  addSubview:startButton];
        _startButton = startButton;
    }
    return _startButton;
}

-(void)start
{
    NSLog(@"now start");
}

- (void)setIndexPath:(NSInteger )indexPath count:(int)count
{
    NSLog(@"%d  %d ",indexPath,count);
    if (indexPath + 1 == count) {
        self.startButton.hidden = NO;
        self.shareButton.hidden = NO;
    }else{
        self.startButton.hidden = YES;
        self.shareButton.hidden = YES;
    }
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.frame = self.bounds;
    self.shareButton.center = CGPointMake(self.frame.size.width/2, self.frame.size.height * 0.65);
    self.startButton.center = CGPointMake(self.frame.size.width/2, self.frame.size.height * 0.9);
}


-(void)setImage:(NSString *)image
{
    _image = image;
    self.imageView = [[UIImageView alloc] init];
    self.imageView.image = [UIImage imageNamed:_image];
    [self.contentView addSubview:self.imageView];
    
}

@end
