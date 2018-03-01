//
//  CollectionViewCell.m
//  InstaKilo
//
//  Created by KevinT on 2018-02-28.
//  Copyright © 2018 KevinT. All rights reserved.
//

#import "CollectionViewCell.h"
#import "ViewController.h"

@implementation CollectionViewCell
- (instancetype)init
{
  self = [super init];
  if (self) {
    ViewController *vc = [[ViewController alloc] init];
    for (int i = 0; i < 10; i++) {
      self.imageView.image = [UIImage imageNamed:[vc.imageMutableArray objectAtIndex:i]];

    }
  }
  return self;
}
@end
