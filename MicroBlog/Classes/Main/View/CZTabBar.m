//
//  CZTabBar.m
//  MicroBlog
//
//  Created by 小白 on 15/10/27.
//  Copyright (c) 2015年 小白. All rights reserved.
//

#import "CZTabBar.h"

@interface CZTabBar ()
@property (nonatomic,strong)UIButton *selectedBtn;
@property (nonatomic,strong)UIButton *plusButton;
@property (nonatomic,strong)NSArray *buttons;
@end


@implementation CZTabBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(NSArray *)buttons{
    if (_buttons == nil) {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}

- (UIButton *)plusButton
{
    if (_plusButton == nil) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        [btn sizeToFit];
        _plusButton = btn;
        [self addSubview:btn];
    }
    return _plusButton;
}


-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat w = self.bounds.size.width;
    CGFloat h = self.bounds.size.height;
    CGFloat btnW = w/(self.items.count + 1);
    CGFloat btnH = h;
 //   NSLog(@"zzz %d",self.items.count);
         //   if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
    int i = 0;
    for (UIView *tabBarItem in self.subviews)
    {
        if ([tabBarItem isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            if (i == 2) {
                i = 3;
            }
         
            tabBarItem.frame = CGRectMake(i*btnW, 0, btnW, btnH);
            i++;
        }
    }
    
 //   NSLog(@"%d",i);
    self.plusButton.center = CGPointMake(0.5*w, 0.5*h);
    
}

-(void)btnClick:(UIButton *)button
{
    
    
}

@end
