//
//  UIBarButtonItem+Item.m
//  MicroBlog
//
//  Created by 小白 on 15/10/28.
//  Copyright (c) 2015年 小白. All rights reserved.
//

#import "UIBarButtonItem+Item.h"

@implementation UIBarButtonItem (Item)


//这里就是将按钮放到barbuttont
+ (UIBarButtonItem *)barButtonItemWithImage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:highImage forState:UIControlStateHighlighted];
    //不能再丢了这个了
    [btn sizeToFit];
    [btn addTarget:target action:action forControlEvents:controlEvents];
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

@end
