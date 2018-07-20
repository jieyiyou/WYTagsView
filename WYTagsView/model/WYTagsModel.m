

//
//  WYTagsModel.m
//  WYTagsView
//
//  Created by 薇谙 on 2018/7/20.
//  Copyright © 2018年 WY. All rights reserved.
//

#import "WYTagsModel.h"

@implementation WYTagsModel

- (instancetype)initWithTagsDict:(NSDictionary *)dict{
    self =[super init];
    if(self ){
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

@end
