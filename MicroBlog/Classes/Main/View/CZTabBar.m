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
    // 遍历模型数组，创建对应tabBarButton
      for (UITabBarItem *item in _items) {
        CZTabBarButton *btn = [CZTabBarButton buttonWithType:UIButtonTypeCustom];
        // 给按钮赋值模型，按钮的内容由模型对应决定
        btn.item = item;
        btn.tag = self.buttons.count;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        if (btn.tag == 0) {
            [self btnClick:btn];
        }
        [self addSubview:btn];
        // 把按钮添加到按钮数组
        [self.buttons addObject:btn];
    }
    
}

// 点击tabBarButton调用
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
        // 默认按钮的尺寸跟背景图片一样大
        // sizeToFit:默认会根据按钮的背景图片或者image和文字计算出按钮的最合适的尺寸
        [btn sizeToFit];
        _plusButton = btn;
        [self addSubview:btn];
    }
    return _plusButton;
}

// self.items UITabBarItem模型，有多少个子控制器就有多少个UITabBarItem模型
// 调整子控件的位置
-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat w = self.bounds.size.width;
    CGFloat h = self.bounds.size.height;
    CGFloat btnW = w/(self.items.count + 1);
    CGFloat btnH = h;
    int i = 0;
    // 设置tabBarButton的frame
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
