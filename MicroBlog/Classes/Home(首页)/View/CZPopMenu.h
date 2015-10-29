//
//  CZPopMenu.h
//  MicroBlog
//
//  Created by 小白 on 15/10/29.
//  Copyright (c) 2015年 小白. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CZPopMenu : UIImageView

+ (instancetype)showInRect:(CGRect)rect;
+ (void)hide;
@property (nonatomic, weak) UIView *contentView;
@end
