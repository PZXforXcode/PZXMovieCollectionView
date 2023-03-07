# PZXMovieCollectionView
中间大两边小，的像电影场次选择的控件
![在makrdown上生成gif动画](https://github.com/PZXforXcode/PZXMovieCollectionView/blob/master/CollectionView中间大两边小/PZXMovieCollectionView.gif)
```
    PZXCollectionViewFlowLayout *layout = [[PZXCollectionViewFlowLayout alloc]init];
    _displayCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 150, self.view.frame.size.width, 350) collectionViewLayout:layout];

设置PZXCollectionViewFlowLayout为collectionView的layout即可 具体可看demo
///Swift 用法
        let layout = PZXCollectionViewFlowLayout.init()
        
        petsCollectionView = UICollectionView.init(frame: CGRect(x: 0, y: TOP_HEIGHT, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - TOP_HEIGHT - TABBAR_HEIGHT), collectionViewLayout: layout)
        
        petsCollectionView.backgroundColor = .white
        petsCollectionView.delegate = self
        petsCollectionView.dataSource = self
        petsCollectionView.register(XYPetRecordCollectionViewCell.self, forCellWithReuseIdentifier: "XYPetRecordCollectionViewCell")
        self.view.addSubview(petsCollectionView);

```
