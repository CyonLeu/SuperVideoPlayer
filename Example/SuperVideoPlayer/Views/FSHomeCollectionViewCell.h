//
//  FSHomeCollectionViewCell.h
//  SuperVideoPlayer_Example
//
//  Created by FlyingFish on 2021/10/19.
//  Copyright © 2021 CyonLeu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

extern NSString *const kFSHomeCollectionViewCell;

@interface FSHomeCollectionViewCell : UICollectionViewCell

- (void)updateCellInfo:(id)data;

@end

NS_ASSUME_NONNULL_END
