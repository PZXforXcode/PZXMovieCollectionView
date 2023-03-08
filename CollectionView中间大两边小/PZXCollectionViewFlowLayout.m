//
//  PZXCollectionViewFlowLayout.m
//  CollectionView中间大两边小
//
//  Created by quark123321 on 2020/7/28.
//  Copyright © 2020 pengzuxin. All rights reserved.
//

#import "PZXCollectionViewFlowLayout.h"

#define SCREENWIDTH [[UIScreen mainScreen]bounds].size.width
#define SCREENHTIGHT [[UIScreen mainScreen]bounds].size.height
#define kTabBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)
#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
#define kNavBarHeight 44.0
#define kTopHeight (kStatusBarHeight + kNavBarHeight)


@interface PZXCollectionViewFlowLayout ()

@property(assign,nonatomic)CGFloat nearbyScale;
@property(assign,nonatomic)CGFloat centerScale;

@end

@implementation PZXCollectionViewFlowLayout


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        //中间放大倍数
        _centerScale = 1.2f;
        //旁边放大倍数
        _nearbyScale = 0.8f;
        
    }
    return self;
}
-(void)prepareLayout{
    
    [super prepareLayout];

    ///这里设置Item的宽高
    ///有几种用法，
    ///1.直接设置宽高，在Cell内布局
    ///2.设置为屏幕宽高，然后在Cell中心放一个View在View里布局
    self.itemSize = CGSizeMake(160, 240);
//    self.minimumInteritemSpacing = 30;
    self.minimumLineSpacing = 30;
    CGFloat left = (self.collectionView.bounds.size.width - self.itemSize.width) / 2.0;
    self.sectionInset = UIEdgeInsetsMake(0, left, 0, left);
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    // 让collectionView滑动的慢一点,分页效果就出来了.
    self.collectionView.decelerationRate = UIScrollViewDecelerationRateFast;

}

-(NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
        
    // 1.1拿到系统已经算好的布局.
    NSArray *attributes = [self deepCopyWithArray:[super layoutAttributesForElementsInRect:rect]];
    // 1.2 计算当前collectionView的中间位置的x值
    CGFloat currentCenterX = self.collectionView.contentOffset.x + self.collectionView.bounds.size.width / 2.0;
    // 1.3遍历当前rect内所有layoutAttributes,计算它跟currentCenterX的距离,距离越远,计算出的缩放值越小,再赋值给layoutAttributes
    for (UICollectionViewLayoutAttributes *attri in attributes) {
        CGFloat itemCenterX = attri.center.x;
        CGFloat delta = ABS(currentCenterX - itemCenterX);//collectionView中心位置 - 当前item中心位置的绝对值
        // 这里取最小值是因为距离大于一个collectionView宽度的计算出来也没有用,不会显示
        delta = MIN(delta, self.collectionView.bounds.size.width);
        CGFloat scale = (self.nearbyScale - self.centerScale) * delta / self.collectionView.bounds.size.width + self.centerScale;
        attri.transform = CGAffineTransformMakeScale(scale, scale);

    }

    return attributes;
}
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    
    return YES;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity{
    
    CGRect rect;

    rect.origin.y = 0;

    rect.origin.x = proposedContentOffset.x;
    rect.size = self.collectionView.frame.size;
    NSArray *attributes = [self deepCopyWithArray:[super layoutAttributesForElementsInRect:rect]];
    // find nearest item
    CGFloat centerX = proposedContentOffset.x + self.collectionView.frame.size.width * 0.5;;
    CGFloat targetOffSetX = 160;//cell的宽
    for (UICollectionViewLayoutAttributes *attribute in attributes) {

        if (ABS(targetOffSetX) > ABS(attribute.center.x - centerX)) {
            targetOffSetX = attribute.center.x - centerX;
        }

    }

    return CGPointMake(proposedContentOffset.x + targetOffSetX, proposedContentOffset.y);


}
-(NSArray *)deepCopyWithArray:(NSArray *)arr {
    
    
    NSMutableArray *arrM = [NSMutableArray array];
    for (UICollectionViewLayoutAttributes *attr in arr) {

      [arrM addObject:[attr copy]];
    }
    return arrM;


}
@end
