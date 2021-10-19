//
//  FSViewController.m
//  SuperVideoPlayer
//
//  Created by CyonLeu on 10/19/2021.
//  Copyright (c) 2021 CyonLeu. All rights reserved.
//

#import "FSViewController.h"
#import "FSDetailViewController.h"

#import "FSHomeCollectionViewCell.h"

@interface FSViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray *items;


@end

@implementation FSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self setupData];
    
    [self setupView];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    self.collectionView.frame = self.view.bounds;
}

/**
 初始化数据相关
 */
- (void)setupData {
    self.items = [@[] mutableCopy];
    
}

/**
 View初始化及布局
 */
- (void)setupView {
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    CGFloat itemSpace = 5;
    CGFloat itemWidth = CGRectGetWidth([UIScreen mainScreen].bounds) - itemSpace;
    layout.itemSize = CGSizeMake(itemWidth, itemWidth * 9/16.0);
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.backgroundColor = [UIColor lightGrayColor];
    [self.collectionView registerNib:[UINib nibWithNibName:kFSHomeCollectionViewCell bundle:nil] forCellWithReuseIdentifier:kFSHomeCollectionViewCell];
    
    
}

#pragma mark - QueryData








#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.items.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    FSHomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kFSHomeCollectionViewCell forIndexPath:indexPath];
    if (indexPath.item < self.items.count) {
        [cell updateCellInfo:self.items[indexPath.item]];
    }
    
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"indexPath:%@", indexPath);
    id model = self.items[indexPath.item];
    NSLog(@"model:%@", model);
    
    
    
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
