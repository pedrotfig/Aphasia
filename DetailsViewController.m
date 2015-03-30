//
//  DetailsViewController.m
//  Aphasia
//
//  Created by Elias Ayache on 29/03/15.
//  Copyright (c) 2015 B-B-BOOM!. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view
    
    self.navigationItem.title = @"Detail";
    
    self.detailImages = [[NSMutableArray alloc] initWithObjects:@"profile.png", @"profile.png", @"profile.png", @"profile.png", @"profile.png",@"profile.png", @"profile.png", @"profile.png",@"profile.png", @"profile.png",nil];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInCollectionView:
(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView
    numberOfItemsInSection:(NSInteger)section
{
    return [[self detailImages] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"DetailCell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    UIImageView *recipeImageView = (UIImageView *)[cell viewWithTag:100];
    recipeImageView.image = [UIImage imageNamed:[self.detailImages objectAtIndex:indexPath.row]];
    
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(7, 7, 7, 7);
}

#pragma mark cell manipulation

-(void)removeDetailCell:(int)i {
    
    [self.collectionView performBatchUpdates:^{
        [self.detailImages removeObjectAtIndex:i];
        NSIndexPath *indexPath =[NSIndexPath indexPathForRow:i inSection:0];
        [self.collectionView deleteItemsAtIndexPaths:[NSArray arrayWithObject:indexPath]];
        
    } completion:^(BOOL finished) {
        
    }];
}




@end
