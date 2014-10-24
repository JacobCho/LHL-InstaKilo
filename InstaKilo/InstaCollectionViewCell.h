//
//  InstaCollectionViewCell.h
//  InstaKilo
//
//  Created by Jacob Cho on 2014-10-23.
//  Copyright (c) 2014 Jacob Cho. All rights reserved.
//

#import <UIKit/UIKit.h>

@class InstaCollectionViewCell;

@protocol InstaCollectionViewCellDelegate <NSObject>

-(void)deletePhoto:(InstaCollectionViewCell *)cell;

@end


@interface InstaCollectionViewCell : UICollectionViewCell <UIGestureRecognizerDelegate>

@property (nonatomic, weak) id<InstaCollectionViewCellDelegate> delegate;
@property (nonatomic, strong) NSMutableArray *subjectList;
@property (nonatomic, strong) NSString *subjectName;
@property (nonatomic, strong) IBOutlet UIImageView *imageView;

@end
