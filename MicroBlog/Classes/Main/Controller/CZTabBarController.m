//
//  CZTabBarController.m
//  MicroBlog
//
//  Created by 小白 on 15/10/26.
//  Copyright (c) 2015年 小白. All rights reserved.
//

#import "CZTabBarController.h"
#import "UIImage+Image.h"
#import "CZTabBar.h"
#import "CZNavigationController.h"

#import "CZDiscoverViewController.h"
@interface CZTabBarController () <CZTabBarDelegate>
@property (nonatomic,strong)NSMutableArray *items;
@end

@implementation CZTabBarController




-(NSMutableArray *)items{
    if (_items == nil) {
        _items = [NSMutableArray array];
    }
    return _items;
}

//这个就是main的主控制器了,首要工作就是先把tabbar先做出来，回来再自定义
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
  //  UITabBarItem *item = [self.tabBarItem];
    
    
    [self setUpAllChildViewController];
    [self setUpTabBar];
}

-(void)setUpTabBar{
    CZTabBar *bar = [[CZTabBar alloc] initWithFrame:self.tabBar.frame];
    bar.backgroundColor = [UIColor whiteColor];

    bar.items = self.items;
    bar.delegate = self;
    [self.view addSubview:bar];
    [self.tabBar removeFromSuperview];

}




- (void)setUpAllChildViewController
{
    // 首页
    UIViewController *home = [[UIViewController alloc] init];
    
    [self setUpOneChildViewController:home image:[UIImage imageNamed:@"tabbar_home"] selectedImage:[UIImage imageWithOriginalName:@"tabbar_home_selected"] title:@"首页"];

    
    
    // 消息
    UIViewController *message = [[UIViewController alloc] init];
    [self setUpOneChildViewController:message image:[UIImage imageNamed:@"tabbar_message_center"] selectedImage:[UIImage imageWithOriginalName:@"tabbar_message_center_selected"] title:@"消息"];

    
    // 发现
    CZDiscoverViewController *discover = [[CZDiscoverViewController alloc] init];
    [self setUpOneChildViewController:discover image:[UIImage imageNamed:@"tabbar_discover"] selectedImage:[UIImage imageWithOriginalName:@"tabbar_discover_selected"] title:@"发现"];

    

    // 我
    CZDiscoverViewController *profile = [[CZDiscoverViewController alloc] init];
    [self setUpOneChildViewController:profile image:[UIImage imageNamed:@"tabbar_profile"] selectedImage:[UIImage imageWithOriginalName:@"tabbar_profile_selected"] title:@"我"];

}

- (void)setUpOneChildViewController:(UIViewController *)vc image:(UIImage *)image selectedImage:(UIImage *)selectedImage title:(NSString *)title
{
    vc.title = title;
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selectedImage;
    vc.tabBarItem.badgeValue = @"d";
    // 保存tabBarItem模型到数组
    [self.items addObject:vc.tabBarItem];
    
    //这个打开 下两行可以注释掉    下面这个函数做了较详细的解释
//    [self addChildViewController:vc];
    CZNavigationController *nav = [[CZNavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}

-(void)didClickButton:(UIButton *)btn
{
    //由于在APPDelegate中设置了根控制器是CZTabBarController,所以他的子视图就是在stroageboard的那里连线的对应代码就是 [self addChildViewController:vc];这样就可以了，但是我们又需要CZNavigationController在界面的上方，所以[self addChildViewController:nav];可以用来封装一下。selectedIndex就是指定显示哪个子控制器，这个数值是按照顺序加进去的。
    self.selectedIndex = btn.tag;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
