//
//  CZCover.m
//  MicroBlog
//
//  Created by 小白 on 15/10/29.
//  Copyright (c) 2015年 小白. All rights reserved.
//

#import "CZCover.h"

@implementation CZCover

-(void)setDimBackground:(BOOL)dimBackground
{
    _dimBackground = dimBackground;
    if (dimBackground == YES) {
        self.backgroundColor = [UIColor blackColor];
        self.alpha = 0.5;
    }else{
        self.backgroundColor = [UIColor clearColor];
        self.alpha = 1;
    }
}

+(instancetype)show
{
    CZCover *cover = [[CZCover alloc] initWithFrame:[UIScreen mainScreen].bounds];
    cover.backgroundColor = [UIColor clearColor];
    [[UIApplication sharedApplication].keyWindow addSubview:cover];
    
    return cover;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self removeFromSuperview];
    if ([_delegate respondsToSelector:@selector(coverDidClickCover:)]) {
        [self.delegate coverDidClickCover:self];
    }
}

@end
