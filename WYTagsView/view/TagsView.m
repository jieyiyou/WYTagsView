
//
//  TagsView.m
//  WYTagsView
//
//  Created by 薇谙 on 2018/7/20.
//  Copyright © 2018年 WY. All rights reserved.
//

#import "TagsView.h"
#import "WYTagsModel.h"

#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
#define KScreenHeight [[UIScreen mainScreen] bounds].size.height

@interface TagsView()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong)NSMutableArray *tagsArr;

@property (nonatomic,strong)UICollectionView *collectionView;

@end

@implementation TagsView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.collectionView];
        [self addData];
    }
    return self;
}

- (void)addData
{
    
    NSString *path =[[NSBundle mainBundle ]pathForResource:@"tagsData.plist" ofType:nil];
    NSArray *dataArr =[NSArray arrayWithContentsOfFile:path];
    for (NSDictionary *dict in dataArr){
        WYTagsModel *model = [[WYTagsModel alloc] initWithTagsDict:dict];
        [self.tagsArr addObject:model];
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.tagsArr.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    WYTagsModel *model =self.tagsArr[indexPath.row];
    CGFloat width = [self widthForLabel:[NSString stringWithFormat:@"%@",model.title] fontSize:16];
    return CGSizeMake(width+10,22);
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WYTagsView" forIndexPath:indexPath];
    WYTagsModel *model =self.tagsArr[indexPath.row];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = [NSString stringWithFormat:@"%@",model.title];
    label.frame = CGRectMake(0, 0, ([self widthForLabel:label.text fontSize:16] + 10), 22);
    label.font = [UIFont systemFontOfSize:16];
    label.layer.cornerRadius = 2.0;
    label.layer.masksToBounds = YES;
    label.layer.borderWidth = 1.0;
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blackColor];
    label.layer.borderColor = [UIColor blackColor].CGColor;
    [cell.contentView addSubview:label];
    return cell;
}

/**
 *  计算文字长度
 */
- (CGFloat)widthForLabel:(NSString *)text fontSize:(CGFloat)font
{
    CGSize size = [text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:font], NSFontAttributeName, nil]];
    return size.width;
}

#pragma mark --- lazy ---
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 20;
        layout.minimumInteritemSpacing = 10;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(10, 80, kScreenWidth - 10 * 2, KScreenHeight) collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"WYTagsView"];
    }
    return _collectionView;
}

- (NSMutableArray *)tagsArr
{
    if (!_tagsArr) {
        _tagsArr = [[NSMutableArray alloc] init];
    }
    return _tagsArr;
}

@end
