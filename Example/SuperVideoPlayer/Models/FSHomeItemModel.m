//
//  FSHomeItemModel.m
//  SuperVideoPlayer_Example
//
//  Created by FlyingFish on 2021/10/19.
//  Copyright © 2021 CyonLeu. All rights reserved.
//

#import "FSHomeItemModel.h"

@implementation FSHomeItemModel

- (instancetype)initWithDictionary:(NSDictionary *)jsonDict{
    self = [super init];
    if (self && jsonDict) {
        self.aid = jsonDict[@"aid"];
        self.tid = jsonDict[@"tid"];
        self.title = jsonDict[@"title"];
        self.pic = jsonDict[@"pic"];
        self.ctime = jsonDict[@"ctime"];
        self.desc = jsonDict[@"desc"];
        self.duration = jsonDict[@"duration"];
        self.shortLink = jsonDict[@"shortLink"];
        self.shortLinkV2 = jsonDict[@"shortLinkV2"];
        self.owner = jsonDict[@"owner"];
    }
    
    return self;
}


@end
