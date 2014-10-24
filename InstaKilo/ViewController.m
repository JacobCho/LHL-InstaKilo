//
//  ViewController.m
//  InstaKilo
//
//  Created by Jacob Cho on 2014-10-23.
//  Copyright (c) 2014 Jacob Cho. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"


@interface ViewController () <InstaCollectionViewCellDelegate, UIImagePickerControllerDelegate> {
    

    NSMutableArray *photosList;
    NSMutableArray *programmingList;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.collectionCell = [[InstaCollectionViewCell alloc] init];

    self.collectionCell.subjectList = [[NSMutableArray alloc] initWithArray:@[@"apple", @"programming"]];
    
    [self getPhotosForHashtag:@"apple"];
    [self getPhotosForHashtag:@"programming"];
}


-(void)getPhotosForHashtag:(NSString *)hashtag {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:[NSString stringWithFormat:@"https://api.instagram.com/v1/tags/%@/media/recent?client_id=34f79b126865425e89bda21418ab468d", hashtag]
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             
             if ([hashtag isEqualToString:@"apple"]) {
                 photosList = [responseObject objectForKey:@"data"];
             }
             else if ([hashtag isEqualToString:@"programming"]) {
                 programmingList = [responseObject objectForKey:@"data"];
             }
             
             [self.collectionView reloadData];
             
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"Error: %@", error);
         }];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return [self.collectionCell.subjectList count];
}


-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return [photosList count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSDictionary *photo = [[NSDictionary alloc] init];
    
    if (indexPath.section == 0) {
    
    photo = [photosList objectAtIndex:indexPath.row];
        
    } else if (indexPath.section == 1){
        
        photo = [programmingList objectAtIndex:indexPath.row];
        
    }
    
    InstaCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"InstagramCell" forIndexPath:indexPath];
    cell.delegate = self;
    
    
    NSString *url = [[[photo objectForKey:@"images"] objectForKey:@"low_resolution"] objectForKey:@"url"];
    
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:url]];
    return cell;
    
}
-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {


}


#pragma mark - Section Header Method
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        InstaCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"sectionHeader" forIndexPath:indexPath];
        NSString *title = self.collectionCell.subjectList[indexPath.section];
        headerView.sectionLabel.text = title;

        reusableview = headerView;
    }
    
    if (kind == UICollectionElementKindSectionFooter) {
        UICollectionReusableView *footerview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterView" forIndexPath:indexPath];
        
        reusableview = footerview;
    }
    
    return reusableview;
}

#pragma mark - InstaCollectionViewCellDelegate method 

-(void)deletePhoto:(InstaCollectionViewCell *)cell {
    
    NSIndexPath *indexPath = [[NSIndexPath alloc] init];
    indexPath = [self.collectionView indexPathForCell:cell];
    
    
    [self.collectionView deleteItemsAtIndexPaths:[NSArray arrayWithObject:indexPath]];
    
    [self.collectionView reloadData];
    
}

@end
