//
//  ViewController.h
//  InstaKilo
//
//  Created by KevinT on 2018-02-28.
//  Copyright © 2018 KevinT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionViewCell.h"
#import "Image.h"
#import "CollectionReusableView.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewCell *collectionViewCell;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

@property (weak, nonatomic) NSMutableArray *imageMutableArray;
@property (nonatomic) long segmentIndex;

//@property (weak, nonatomic) IBOutlet CollectionViewCell *collectionViewCell;

@end

