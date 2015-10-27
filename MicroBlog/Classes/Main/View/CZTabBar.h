//
//  CZTabBar.h
//  MicroBlog
//
//  Created by 小白 on 15/10/27.
//  Copyright (c) 2015年 小白. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CZTabBar;

@protocol CZTabBarDelegate <NSObject>

@optional
-(void)didClickButton:(UIButton *)btn;

@end




@interface CZTabBar : UIView

@property (nonatomic,weak)NSArray *items;
@property (nonatomic,weak)id <CZTabBarDelegate> delegate;




@end
