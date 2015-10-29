//
//  CZCover.h
//  MicroBlog
//
//  Created by 小白 on 15/10/29.
//  Copyright (c) 2015年 小白. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CZCover;
@protocol CZCoverDelegate <NSObject>
@optional
-(void)coverDidClickCover:(CZCover *)cover;
@end


@interface CZCover : UIView

@property (nonatomic, assign) BOOL dimBackground;
@property (weak,nonatomic)id <CZCoverDelegate> delegate;

+(instancetype)show;
@end
