//
//  CZTabBarButton.m
//  MicroBlog
//
//  Created by 小白 on 15/10/27.
//  Copyright (c) 2015年 小白. All rights reserved.
//

#import "CZTabBarButton.h"
#import "CZBadgeView.h"
#import "UIView+Frame.h"
@interface CZTabBarButton ()
@property (nonatomic,weak)CZBadgeView *badgeView;
@end


@implementation CZTabBarButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(CZBadgeView *)badgeView
{
    if (_badgeView == nil) {
        CZBadgeView *btn = [CZBadgeView buttonWithType:UIButtonTypeCustom];
        [self addSubview:btn];
        _badgeView = btn;
        
    }
    return _badgeView;
}


-(void)setItem:(UITabBarItem *)item
{
    _item = item;
    [self setTitle:item.title forState:UIControlStateNormal];
    [self setImage:item.image forState:UIControlStateNormal];
    [self setImage:item.selectedImage forState:UIControlStateSelected];
    self.badgeView.badgeValue = item.badgeValue;

}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:13];
    }
    
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    CGFloat imageW = self.bounds.size.width;
    CGFloat imageH = self.bounds.size.height * 0.7;
    self.imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
    
    CGFloat titleX = 0;
    CGFloat titleY = imageH - 3;
    CGFloat titleW = self.bounds.size.width;
    CGFloat titleH = self.bounds.size.height * 0.3;
    self.titleLabel.frame = CGRectMake(titleX, titleY, titleW, titleH);
    
    self.badgeView.x = self.width - self.badgeView.width - 10;
    self.badgeView.y = 0;
}

@end
