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

#import "FSHomeItemModel.h"

@interface FSViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray *items;


@end

@implementation FSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.title = @"最新视频";
    
    [self setupData];
    
    [self setupView];
    
    [self queryData];
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
    CGFloat itemWidth = floor((CGRectGetWidth([UIScreen mainScreen].bounds) - itemSpace) / 2);
    layout.itemSize = CGSizeMake(itemWidth, itemWidth * 9/16.0 + 35);
    layout.minimumLineSpacing = itemSpace * 2;
    layout.minimumInteritemSpacing = itemSpace;
    
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerNib:[UINib nibWithNibName:kFSHomeCollectionViewCell bundle:nil] forCellWithReuseIdentifier:kFSHomeCollectionViewCell];
    
    [self.view addSubview:self.collectionView];
}

#pragma mark - QueryData

- (void)queryData {
//    NSURL *url = [NSURL URLWithString:@"https://www.bilibili.com/index/ding.json"];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"homeList" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    if (!data) {
        //读取失败
        return;
    }
    
    NSError *error = nil;
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingFragmentsAllowed error:&error];
    if (error) {
        NSLog(@"解析失败：%@", error.localizedDescription);
        return;
    }
    
    NSMutableArray *resultArray = [@[] mutableCopy];
    for (NSString *key in jsonDict.keyEnumerator) {
        NSDictionary *itemDict = jsonDict[key];
        NSLog(@"itemDict:%@", itemDict);
        FSHomeItemModel *model = [[FSHomeItemModel alloc] initWithDictionary:itemDict];
        [resultArray addObject:model];
    }
    
    [self.items addObjectsFromArray:resultArray];
    [self.items addObjectsFromArray:resultArray];//增加数据列表
    
    [self.collectionView reloadData];
}




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
        
    FSDetailViewController *detailVC = [[FSDetailViewController alloc] init];
    detailVC.model = model;
    
    [self.navigationController pushViewController:detailVC animated:YES];
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
