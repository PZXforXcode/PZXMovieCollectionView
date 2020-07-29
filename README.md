# PZXMovieCollectionView
中间大两边小，的像电影场次选择的控件
![在makrdown上生成gif动画](https://github.com/PZXforXcode/PZXMovieCollectionView/blob/master/CollectionView中间大两边小/PZXMovieCollectionView.gif)
```
    PZXCollectionViewFlowLayout *layout = [[PZXCollectionViewFlowLayout alloc]init];
    _displayCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 150, self.view.frame.size.width, 350) collectionViewLayout:layout];

设置PZXCollectionViewFlowLayout为collectionView的layout即可 具体可看demo

```
