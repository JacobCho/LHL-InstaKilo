//
//  InstaCollectionViewCell.h
//  InstaKilo
//
//  Created by Jacob Cho on 2014-10-23.
//  Copyright (c) 2014 Jacob Cho. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InstaCollectionViewCell : UICollectionViewCell


@property (nonatomic, strong) NSString *subject;
@property (nonatomic, strong) IBOutlet UIImageView *imageView;

@end
