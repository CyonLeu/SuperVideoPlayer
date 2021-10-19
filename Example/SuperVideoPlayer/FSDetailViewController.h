//
//  FSDetailViewController.h
//  SuperVideoPlayer_Example
//
//  Created by FlyingFish on 2021/10/19.
//  Copyright © 2021 CyonLeu. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 视频详情播放页
 使用SuperVideoPlayer来播放视频
 */
#import "FSHomeItemModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FSDetailViewController : UIViewController

@property (strong, nonatomic) FSHomeItemModel *model;

@end

NS_ASSUME_NONNULL_END
