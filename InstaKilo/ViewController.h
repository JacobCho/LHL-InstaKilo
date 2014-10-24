//
//  ViewController.h
//  InstaKilo
//
//  Created by Jacob Cho on 2014-10-23.
//  Copyright (c) 2014 Jacob Cho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InstaCollectionViewCell.h"
#import "InstaCollectionReusableView.h"
#import "InstaPhoto.h"


@interface ViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>


@property (nonatomic, strong) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) InstaCollectionViewCell *collectionCell;
@property (nonatomic, strong) InstaPhoto *instaPhoto;

@end

