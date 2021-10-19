//
//  FSHomeCollectionViewCell.m
//  SuperVideoPlayer_Example
//
//  Created by FlyingFish on 2021/10/19.
//  Copyright © 2021 CyonLeu. All rights reserved.
//

#import "FSHomeCollectionViewCell.h"
#import "FSHomeItemModel.h"
#import <UIImageView+WebCache.h>

NSString *const kFSHomeCollectionViewCell = @"FSHomeCollectionViewCell";

@interface FSHomeCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation FSHomeCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)updateCellInfo:(id)data {
    FSHomeItemModel *model = (FSHomeItemModel *)data;
    
    self.titleLabel.text = model.title;
    
    if (model.pic) {
        NSString *pic = [model.pic stringByReplacingOccurrencesOfString:@"http:" withString:@"https:"];
        [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:pic] completed:nil];
    }
    
}
@end
