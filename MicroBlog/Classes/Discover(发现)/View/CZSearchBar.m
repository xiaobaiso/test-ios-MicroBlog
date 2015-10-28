//
//  CZSearchBar.m
//  MicroBlog
//
//  Created by 小白 on 15/10/28.
//  Copyright (c) 2015年 小白. All rights reserved.
//

#import "CZSearchBar.h"
#import "UIView+Frame.h"
@implementation CZSearchBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.font = [UIFont systemFontOfSize:14];
        self.textColor = [UIColor blackColor];
        self.backgroundColor = [UIColor whiteColor];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"searchbar_textfield_search_icon"]];
        //当我写到这里的时候，虽然我看了对比代码，但是我还是没有写对，这里对图片的宽度加了10 如果没有UIViewContentModeCenter 那么他就被拉伸了 真是憋屈
        //图片默认在里面是填充到整个view的，用居中的话显示效果较好。
        imageView.width += 10;
        imageView.contentMode = UIViewContentModeCenter;
        self.leftView = imageView;
        self.leftViewMode = UITextFieldViewModeAlways;
    }
    return self;
}

@end
