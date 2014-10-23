//
//  ViewController.m
//  InstaKilo
//
//  Created by Jacob Cho on 2014-10-23.
//  Copyright (c) 2014 Jacob Cho. All rights reserved.
//

#import "ViewController.h"
#import "InstaCollectionViewCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    InstaCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"InstagramCell" forIndexPath:indexPath];
    
    
    
    return cell;
    
}
-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {


}
@end
