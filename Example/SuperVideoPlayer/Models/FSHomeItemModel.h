//
//  FSHomeItemModel.h
//  SuperVideoPlayer_Example
//
//  Created by FlyingFish on 2021/10/19.
//  Copyright © 2021 CyonLeu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FSHomeItemModel : NSObject

@property (copy, nonatomic) NSString *aid;
@property (copy, nonatomic) NSString *tid;
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *pic;
@property (copy, nonatomic) NSString *ctime;
@property (copy, nonatomic) NSString *desc;
@property (copy, nonatomic) NSString *duration;
@property (copy, nonatomic) NSString *shortLink;
@property (copy, nonatomic) NSString *shortLinkV2;
@property (copy, nonatomic) NSDictionary *owner;


- (instancetype)initWithDictionary:(NSDictionary *)jsonDict;

@end

NS_ASSUME_NONNULL_END
