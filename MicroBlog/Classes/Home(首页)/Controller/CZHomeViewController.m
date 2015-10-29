//
//  CZHomeViewController.m
//  MicroBlog
//
//  Created by 小白 on 15/10/28.
//  Copyright (c) 2015年 小白. All rights reserved.
//

#import "CZHomeViewController.h"
#import "UIBarButtonItem+Item.h"
#import "CZTitleButton.h"
#import "CZOneViewController.h"
#import "CZCover.h"
#import "CZPopMenu.h"
#import "UIView+Frame.h"
@interface CZHomeViewController () <CZCoverDelegate>
@property (nonatomic,weak)CZTitleButton *titleButton;
@property (nonatomic,strong)CZOneViewController *one;
@end

/**
 系统的说下这个首页的制作：
 首先navigationbar上面的左右两个按钮就不说了，这个简单，注意要加上[btn sizeToFit];因为这个能够根据图片的大小去计算按钮的大小，如果你起先设置了大小，那么他还是会计算图片文字等得大小来算这个按钮的整体大小
 重点来了：CZCover 这个是蒙版，作用是将整个窗体封住，这样的话只要在这里点击下就将PopMeun这个弹框关闭，注意这个蒙版是透明的，说白了就是为了接受一个点击事件。
 CZPopMenu这个是弹框，这个弹框里面是个tableView，而这个CZpopMenu是个View，这里有OneViewController是tableview，所以用了它的view，加到CZpopMenu里面去，这样就有tableview了，而且还有个好处，一般来说数据是从VIewController里面导入的，如果用了CZOneViewController的话，就说明了里面的数据可以直接填充了，这样就很好了。   这里还做了一个边框
 [UIApplication sharedApplication].keyWindow addSubview  这个函数应该是可以设置全局窗体的，任何窗体都可以往上面放。可以学习怎么去操作。
 
**/

@implementation CZHomeViewController

-(CZOneViewController *)one{
    if (_one == nil) {
        _one = [[CZOneViewController alloc] init];
    }
    return _one;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self setUpNavgationBar];
}

-(void)friendsearch
{
    
}

-(void)pop
{
    
}


-(void)setUpNavgationBar
{
    // 左边
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"navigationbar_friendsearch"] highImage:[UIImage imageNamed:@"navigationbar_friendsearch_highlighted"] target:self action:@selector(friendsearch) forControlEvents:UIControlEventTouchUpInside];
    
    // 右边
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"navigationbar_pop"] highImage:[UIImage imageNamed:@"navigationbar_pop_highlighted"] target:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
    
 //   UILabel *aa = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
 //   aa.text = @"ddd";
    CZTitleButton *titleButton = [[CZTitleButton alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];//[CZTitleButton buttonWithType:UIButtonTypeCustom];
    _titleButton = titleButton;
    
   // [titleButton setBackgroundColor:[UIColor redColor]];
    [titleButton setTitle:@"首页" forState:UIControlStateNormal];

    [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateNormal];
    [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateReserved];
    [titleButton sizeToFit];
//    // 高亮的时候不需要调整图片
    titleButton.adjustsImageWhenHighlighted = NO;
//    
    [titleButton addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.titleView = titleButton;
}

// 以后只要显示在最前面的控件，一般都加在主窗口
// 点击标题按钮
- (void)titleClick:(UIButton *)button
{
    button.selected = !button.selected;

    CZCover *cover = [CZCover show];
    cover.delegate = self;
    
    CGFloat popW = 200;
    CGFloat popH = popW;
    CGFloat popX = (self.view.width - popW) * 0.5;
    CGFloat popY = 50;
    
    CZPopMenu *popMenu = [CZPopMenu showInRect:CGRectMake(popX, popY, popW, popH)];
    popMenu.contentView = self.one.view;
    
}

- (void)coverDidClickCover:(CZCover *)cover
{
    // 隐藏pop菜单
    [CZPopMenu hide];
    
    _titleButton.selected = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
