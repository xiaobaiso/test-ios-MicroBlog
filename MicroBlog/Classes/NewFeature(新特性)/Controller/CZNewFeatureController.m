//
//  CZNewFeatureController.m
//  MicroBlog
//
//  Created by 小白 on 15/10/30.
//  Copyright (c) 2015年 小白. All rights reserved.
//

#import "CZNewFeatureController.h"
#import "CZNewFeatureCell.h"
@interface CZNewFeatureController ()
@property (nonatomic,strong)UIPageControl *control;
@end

@implementation CZNewFeatureController

static NSString * const reuseIdentifier = @"cell";

-(instancetype)init{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = [UIScreen mainScreen].bounds.size;
    layout.minimumLineSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    return [super initWithCollectionViewLayout:layout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    //这里注册cell是什么类，默认就会创建这个类
    // Register cell classes
    [self.collectionView registerClass:[CZNewFeatureCell class] forCellWithReuseIdentifier:reuseIdentifier];
    // 分页
    self.collectionView.pagingEnabled = YES;//就是一页页的拉
    self.collectionView.bounces = NO;//不可以拉出超出区域的位置
    self.collectionView.showsHorizontalScrollIndicator = NO;//这个就是滚动条吧 话说这个类是继承了scrollView
    // Do any additional setup after loading the view.
    [self setUpPageControl];
}


- (void)setUpPageControl
{
    UIPageControl *control = [[UIPageControl alloc] init];
    control.numberOfPages = 4;
    control.pageIndicatorTintColor = [UIColor blackColor];
    control.currentPageIndicatorTintColor = [UIColor redColor];
    control.center = CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height * 0.99);
    _control = control;
    [self.view addSubview:control];
}

// 只要一滚动就会调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.control.currentPage = scrollView.contentOffset.x / scrollView.frame.size.width + 0.5;
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

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete method implementation -- Return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete method implementation -- Return the number of items in the section
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CZNewFeatureCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.image = [NSString stringWithFormat:@"new_feature_%ld",indexPath.row + 1];
    [cell setIndexPath:indexPath.row count:4];
    
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
