//
//  CZTitleButton.m
//  MicroBlog
//
//  Created by 小白 on 15/10/28.
//  Copyright (c) 2015年 小白. All rights reserved.
//

#import "CZTitleButton.h"
#import "UIBarButtonItem+Item.h"
#import "UIView+Frame.h"
#import "UIImage+Image.h"
@implementation CZTitleButton


-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage imageWithStretchableName:@"navigationbar_filter_background_highlighted"] forState:UIControlStateHighlighted];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    if (self.currentImage == nil) {
        return;
    }
    self.titleLabel.x = 0;
    self.imageView.x = CGRectGetMaxX(self.titleLabel.frame);
}

//- (void)setTitle:(NSString *)title forState:(UIControlState)state
//{
//    [self setTitle:title forState:state];
////    [self sizeToFit];
//}

//- (void)setImage:(UIImage *)image forState:(UIControlState)state
//{
//    [self setImage:image forState:state];
//    //[self sizeToFit];
//}


@end
