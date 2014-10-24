//
//  InstaCollectionViewCell.m
//  InstaKilo
//
//  Created by Jacob Cho on 2014-10-23.
//  Copyright (c) 2014 Jacob Cho. All rights reserved.
//

#import "InstaCollectionViewCell.h"

@implementation InstaCollectionViewCell

-(void)awakeFromNib {
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
    tapRecognizer.delegate = self;
    [tapRecognizer setNumberOfTapsRequired:2];
    [self addGestureRecognizer:tapRecognizer];
  
}


-(void)tapGesture:(UITapGestureRecognizer *)sender {


        NSLog(@"Double tapped!");
        [self.delegate deletePhoto:self];
    
}

@end
