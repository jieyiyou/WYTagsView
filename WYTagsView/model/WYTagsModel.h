//
//  WYTagsModel.h
//  WYTagsView
//
//  Created by 薇谙 on 2018/7/20.
//  Copyright © 2018年 WY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYTagsModel : NSObject

@property (nonatomic,strong)NSString *title;

@property (nonatomic,strong)NSString *color;

- (instancetype)initWithTagsDict:(NSDictionary *)dict;


@end
