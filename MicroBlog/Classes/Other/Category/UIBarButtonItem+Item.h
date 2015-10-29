//
//  UIBarButtonItem+Item.h
//  MicroBlog
//
//  Created by 小白 on 15/10/28.
//  Copyright (c) 2015年 小白. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Item)

+ (UIBarButtonItem *)barButtonItemWithImage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;

@end
