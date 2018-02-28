//
//  ViewController.m
//  InstaKilo
//
//  Created by KevinT on 2018-02-28.
//  Copyright © 2018 KevinT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UICollectionViewDataSource>

@end

@implementation ViewController

- (UICollectionViewFlowLayout *)layoutSetup {
  UICollectionViewFlowLayout *cVLayout = [[UICollectionViewFlowLayout alloc] init];
  cVLayout.itemSize = CGSizeMake(178, 100);
  cVLayout.sectionInset = UIEdgeInsetsMake(5,5,5,5); //padding around section
  cVLayout.minimumInteritemSpacing = 5; //min horizontal spacing between cells
  cVLayout.minimumLineSpacing = 5; //min vertical spacing
  cVLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
  cVLayout.headerReferenceSize = CGSizeMake(self.collectionView.frame.size.width, 50);
  cVLayout.footerReferenceSize = CGSizeMake(self.collectionView.frame.size.width, 10);
  return cVLayout;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  
  self.collectionView.dataSource = self;
  
  UICollectionViewFlowLayout * cVLayout = [self layoutSetup];
  self.collectionView.collectionViewLayout = cVLayout;
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
  return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
  switch (section) {
    case 0:
      return 7;
      break;
    case 1:
      return 3;
      break;
    default:
      return 10;
      break;
  }
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  NSString *cellId;
  switch (indexPath.section) {
    case 0:
      cellId = @"myDayPics";
      break;
    case 1:
      cellId = @"myNightPics";
    default:
      cellId = @"myDayPics";
      break;
  }
      CollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
      
      return cell;
}

@end
