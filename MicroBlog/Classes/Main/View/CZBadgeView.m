//
//  CZBadgeView.m
//  MicroBlog
//
//  Created by 小白 on 15/10/27.
//  Copyright (c) 2015年 小白. All rights reserved.
//

#import "CZBadgeView.h"
#import "UIView+Frame.h"
@implementation CZBadgeView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = NO;//关闭用户的触摸
        [self setBackgroundImage:[UIImage imageNamed:@"main_badge"] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:13];
        [self sizeToFit];
    }
    return self;
}

-(void)setBadgeValue:(NSString *)badgeValue{
    _badgeValue = badgeValue;
    if (badgeValue.length == 0 || [badgeValue isEqualToString:@"0"]) {
        self.hidden = YES;
    }else{
        self.hidden = NO;
    }
  
    CGSize size = [badgeValue sizeWithFont:[UIFont systemFontOfSize:11]];
    if (size.width > self.width) { // 文字的尺寸大于控件的宽度
        [self setImage:[UIImage imageNamed:@"new_dot"] forState:UIControlStateNormal];
        [self setTitle:nil forState:UIControlStateNormal];
        [self setBackgroundImage:nil forState:UIControlStateNormal];
    }else{
        [self setBackgroundImage:[UIImage imageNamed:@"main_badge"] forState:UIControlStateNormal];
        [self setTitle:badgeValue forState:UIControlStateNormal];
        [self setImage:nil forState:UIControlStateNormal];
    }
    
    
}


@end
