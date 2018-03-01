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
- (IBAction)segmentedControlChanged:(id)sender {
  self.segmentIndex = self.segmentedControl.selectedSegmentIndex;
  [self.collectionView reloadData ];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  
  self.collectionView.dataSource = self;
  
  UICollectionViewFlowLayout * cVLayout = [self layoutSetup];
  self.collectionView.collectionViewLayout = cVLayout;
  
  NSMutableArray *imageMutableArray = [[NSMutableArray alloc] init];
  for (int i = 0; i < 10; i++) {
    [imageMutableArray addObject:[NSString stringWithFormat: @"gts%d", i]];
//    Image *image = [[Image alloc] init];
//    image = [Image ]
    NSLog(@"added gts%d", i);
  }
  self.imageMutableArray = imageMutableArray;
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
      cellId = @"myPics";
      break;
    case 1:
      cellId = @"myPics2";
      break;
    default:
      cellId = @"myPics";
      break;
  }
  NSLog(@"%@", cellId);
  NSLog(@"section %ld, row %ld", (long)indexPath.section, (long)indexPath.row);
  CollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
  
  cell.imageView.image = [UIImage imageNamed:@"gts0"];
//  cell.imageView.backgroundColor = [UIColor blueColor];
  
      return cell;
}

// The view that is returned must be retrieved from a call to -dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
  CollectionReusableView *headerView = [self.collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                                                     withReuseIdentifier:@"MyHeaderView"
                                                                            forIndexPath:indexPath];
  headerView.headerLabel.text = [NSString stringWithFormat:@"%lu", self.segmentedControl.selectedSegmentIndex];
  return headerView;
}

@end
