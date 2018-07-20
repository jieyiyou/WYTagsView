//
//  ViewController.m
//  WYTagsView
//
//  Created by 薇谙 on 2018/7/20.
//  Copyright © 2018年 WY. All rights reserved.
//

#import "ViewController.h"
#import "TagsView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    TagsView *view = [[TagsView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    [self.view addSubview:view];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
