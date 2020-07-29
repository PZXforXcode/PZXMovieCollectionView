//
//  ViewController.m
//  CollectionView中间大两边小
//
//  Created by quark123321 on 2020/7/28.
//  Copyright © 2020 pengzuxin. All rights reserved.
//

#import "ViewController.h"
#import "PZXCollectionViewFlowLayout.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong)UICollectionView *displayCollectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    PZXCollectionViewFlowLayout *layout = [[PZXCollectionViewFlowLayout alloc]init];


//    layout.itemSize
    _displayCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 150, self.view.frame.size.width, 350) collectionViewLayout:layout];
    _displayCollectionView.showsHorizontalScrollIndicator = NO;
    [_displayCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    _displayCollectionView.backgroundColor = [UIColor whiteColor];
    _displayCollectionView.delegate = self;
    _displayCollectionView.dataSource = self;
    [self.view addSubview:_displayCollectionView];
    
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 5;
    
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
        cell.layer.borderColor = [UIColor cyanColor].CGColor;
        cell.layer.borderWidth = 0.8;
        cell.layer.cornerRadius = 6;
        cell.layer.masksToBounds = YES;
        cell.backgroundColor = [UIColor cyanColor];
        return cell;

}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];

}
@end
