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



-(void)setUpAllChildViewController
{
    UIViewController *home = [[UIViewController alloc] init];
    [self setUpOneChildViewController:home name:@"首页" image:@"tabbar_home" selectedImage:@"tabbar_home_selected"];
    
    UIViewController *message = [[UIViewController alloc] init];
    [self setUpOneChildViewController:message name:@"信息" image:@"tabbar_message_center" selectedImage:@"tabbar_message_center_selected"];
    
    CZDiscoverViewController *discover = [[CZDiscoverViewController alloc] init];
    [self setUpOneChildViewController:discover name:@"发现" image:@"tabbar_discover" selectedImage:@"tabbar_discover_selected"];
    
    UIViewController *profile = [[UIViewController alloc] init];
    [self setUpOneChildViewController:profile name:@"我" image:@"tabbar_profile" selectedImage:@"tabbar_profile_selected"];
}

-(void)setUpOneChildViewController:(UIViewController *)vc name:(NSString *)name image:(NSString *)image selectedImage:(NSString *)selectedImage;
{
    
//    UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:name image:[UIImage imageNamed:image] selectedImage:[UIImage imageNamed:selectedImage]];
    vc.title = name;
    vc.tabBarItem.image = [UIImage imageWithOriginalName:image];
    vc.tabBarItem.selectedImage = [UIImage imageWithOriginalName:selectedImage];
    //[self addChildViewController:vc];
//    vc.tabBarItem.badgeValue = @"d";
    [self.items addObject:vc.tabBarItem];
    
    CZNavigationController *navi = [[CZNavigationController alloc]initWithRootViewController:vc];
    [self addChildViewController:navi];
}

-(void)didClickButton:(UIButton *)btn
{
   // NSLog(@"%ld click",(long)btn.tag);
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
