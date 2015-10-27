//
//  CZTabBar.m
//  MicroBlog
//
//  Created by 小白 on 15/10/27.
//  Copyright (c) 2015年 小白. All rights reserved.
//

#import "CZTabBar.h"
#import "CZTabBarButton.h"
@interface CZTabBar ()
@property (nonatomic,weak)UIButton *selectedBtn;
@property (nonatomic,weak)UIButton *plusButton;
@property (nonatomic,strong)NSMutableArray *buttons;
@end


@implementation CZTabBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(NSMutableArray *)buttons{
    if (_buttons == nil) {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}

-(void)setItems:(NSArray *)items
{
    _items = items;
      for (UITabBarItem *item in _items) {
        CZTabBarButton *btn = [CZTabBarButton buttonWithType:UIButtonTypeCustom];
        btn.item = item;
        btn.tag = self.buttons.count;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        if (btn.tag == 0) {
            [self btnClick:btn];
        }
        [self addSubview:btn];
        [self.buttons addObject:btn];
    }
    
}

-(void)btnClick:(UIButton *)btn
{
    self.selectedBtn.selected = NO;
    self.selectedBtn = btn;
    self.selectedBtn.selected = YES;
    
    if ([self.delegate respondsToSelector:@selector(didClickButton:)]) {
        [self.delegate didClickButton:btn];
    }
    
}




- (UIButton *)plusButton
{
    if (_plusButton == nil) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
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
    int i = 0;
    for (UIView *tabBarItem in self.buttons)
    {
//        if ([tabBarItem isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            if (i == 2) {
                i = 3;
            }
         
            tabBarItem.frame = CGRectMake(i*btnW, 0, btnW, btnH);
            i++;
//        }
    }

    self.plusButton.center = CGPointMake(0.5*w, 0.5*h);
    
}


@end
