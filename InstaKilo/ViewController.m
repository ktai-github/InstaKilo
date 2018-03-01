//
//  ViewController.m
//  InstaKilo
//
//  Created by KevinT on 2018-02-28.
//  Copyright © 2018 KevinT. All rights reserved.
//

#import "ViewController.h"

NSMutableArray *subjectMasterArray;
NSMutableArray *locationMasterArray;
NSMutableArray *subject0Array;
NSMutableArray *subject1Array;
NSMutableArray *location0Array;
NSMutableArray *location1Array;

@interface ViewController () <UICollectionViewDataSource>

@end

@implementation ViewController

- (IBAction)segmentedControlChanged:(id)sender {
//  self.segmentIndex = self.segmentedControl.selectedSegmentIndex;
  [self.collectionView reloadData ];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  
  self.collectionView.dataSource = self;
  
  UICollectionViewFlowLayout * cVLayout = [self layoutSetup];
  self.collectionView.collectionViewLayout = cVLayout;
  
  NSMutableArray *imageMutableArray = [[NSMutableArray alloc] init];
  
  imageSetup(imageMutableArray);
  
  self.imageMutableArray = imageMutableArray;
  
  subjectLocationArraysSetup(imageMutableArray);
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
  
  switch (self.segmentedControl.selectedSegmentIndex) {
    case 0:
      return subjectMasterArray.count;
      break;
    case 1:
      return locationMasterArray.count;
      break;
    default:
      return 10;
      break;
  }
  
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
  switch (self.segmentedControl.selectedSegmentIndex) {
    case 0:
      if (section == 0) {
        return subject0Array.count;
      } else {
        return subject1Array.count; //section = 1
      }
      break;
    case 1:
      if (section == 0) {
        return location0Array.count;
      } else {
        return location1Array.count; //section = 1
      }
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

static void imageSetup(NSMutableArray *imageMutableArray) {
  Image *image1 = [[Image alloc] init];
  image1.image = [UIImage imageNamed:@"gts0"];
  image1.subject = @"subject 0";
  image1.location = @"location 0";
  [imageMutableArray addObject:image1];
  NSLog(@"added gts0");
  
  Image *image2 = [[Image alloc] init];
  image2.image = [UIImage imageNamed:@"gts1"];
  image2.subject = @"subject 0";
  image2.location = @"location 1";
  [imageMutableArray addObject:image2];
  NSLog(@"added gts1");
  
  Image *image3 = [[Image alloc] init];
  image3.image = [UIImage imageNamed:@"gts2"];
  image3.subject = @"subject 1";
  image3.location = @"location 0";
  [imageMutableArray addObject:image3];
  NSLog(@"added gts2");
  
  Image *image4 = [[Image alloc] init];
  image4.image = [UIImage imageNamed:@"gts3"];
  image4.subject = @"subject 1";
  image4.location = @"location 1";
  [imageMutableArray addObject:image4];
  NSLog(@"added gts3");
  
  Image *image5 = [[Image alloc] init];
  image5.image = [UIImage imageNamed:@"gts4"];
  image5.subject = @"subject 0";
  image5.location = @"location 0";
  [imageMutableArray addObject:image5];
  NSLog(@"added gts4");
  
  Image *image6 = [[Image alloc] init];
  image6.image = [UIImage imageNamed:@"gts5"];
  image6.subject = @"subject 0";
  image6.location = @"location 1";
  [imageMutableArray addObject:image6];
  NSLog(@"added gts5");
  
  Image *image7 = [[Image alloc] init];
  image7.image = [UIImage imageNamed:@"gts6"];
  image7.subject = @"subject 1";
  image7.location = @"location 0";
  [imageMutableArray addObject:image7];
  NSLog(@"added gts6");
  
  Image *image8 = [[Image alloc] init];
  image8.image = [UIImage imageNamed:@"gts8"];
  image8.subject = @"subject 1";
  image8.location = @"location 1";
  [imageMutableArray addObject:image8];
  NSLog(@"added gts8");
  
  Image *image9 = [[Image alloc] init];
  image9.image = [UIImage imageNamed:@"gts9"];
  image9.subject = @"subject 0";
  image9.location = @"location 0";
  [imageMutableArray addObject:image9];
  NSLog(@"added gts9");
  
  Image *image10 = [[Image alloc] init];
  image10.image = [UIImage imageNamed:@"gts10"];
  image10.subject = @"subject 0";
  image10.location = @"location 1";
  [imageMutableArray addObject:image10];
  NSLog(@"added gts10");
  
}


static void subjectLocationArraysSetup(NSMutableArray *imageMutableArray) {
  
  NSMutableArray *subject0Array = [[NSMutableArray alloc] init];
  for (int i = 0; i < imageMutableArray.count; i++) {
    Image *tempImage = [[Image alloc] init];
    tempImage = [imageMutableArray objectAtIndex:i];
    if ([tempImage.subject isEqualToString:@"0"]) {
      [subject0Array addObject:tempImage];
      NSLog(@"added to subject 0 - %d", i);
    }
  }
  
  NSMutableArray *subject1Array = [[NSMutableArray alloc] init];
  for (int i = 0; i < imageMutableArray.count; i++) {
    Image *tempImage = [[Image alloc] init];
    tempImage = [imageMutableArray objectAtIndex:i];
    if ([tempImage.subject isEqualToString:@"1"]) {
      [subject1Array addObject:tempImage];
      NSLog(@"added to subject 1 - %d", i);
    }
  }
  
  NSMutableArray *location0Array = [[NSMutableArray alloc] init];
  for (int i = 0; i < imageMutableArray.count; i++) {
    Image *tempImage = [[Image alloc] init];
    tempImage = [imageMutableArray objectAtIndex:i];
    if ([tempImage.location isEqualToString:@"0"]) {
      [location0Array addObject:tempImage];
      NSLog(@"added to location 0 - %d", i);
    }
  }
  
  NSMutableArray *location1Array = [[NSMutableArray alloc] init];
  for (int i = 0; i < imageMutableArray.count; i++) {
    Image *tempImage = [[Image alloc] init];
    tempImage = [imageMutableArray objectAtIndex:i];
    if ([tempImage.location isEqualToString:@"1"]) {
      [location1Array addObject:tempImage];
      NSLog(@"added to location 1 - %d", i);
    }
  }
  
  subjectMasterArray = [[NSMutableArray alloc] initWithObjects:subject0Array,subject1Array, nil];
  locationMasterArray = [[NSMutableArray alloc] initWithObjects:location0Array,location1Array, nil];

}
@end
