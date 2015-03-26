//
//  BoardViewerViewController.m
//  Aphasia
//
//  Created by Pedro Figueiredo on 3/25/15.
//  Copyright (c) 2015 B-B-BOOM!. All rights reserved.
//

#define IMAGES_PER_PAGE 6

#import "BoardViewerViewController.h"

@interface BoardViewerViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSArray *dataArray;

@end

@implementation BoardViewerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSMutableArray *firstSection = [[NSMutableArray alloc] init];
    for (int i=0; i<IMAGES_PER_PAGE; i++) {
        [firstSection addObject:[NSString stringWithFormat:@"Cell %d", i]];
    }
    self.dataArray = [[NSArray alloc] initWithObjects:firstSection, nil];
    
    UINib *cellNib = [UINib nibWithNibName:@"ImageCell" bundle:nil];
    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:@"cvCell"];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setItemSize:CGSizeMake(250, 250)];
    //[flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    [self.collectionView setCollectionViewLayout:flowLayout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return [self.dataArray count];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [[self.dataArray objectAtIndex:section] count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSMutableArray *data = [self.dataArray objectAtIndex:indexPath.section];
    
    NSString *cellData = [data objectAtIndex:indexPath.row];
    
    static NSString *cellIdentifier = @"cvCell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    UILabel *titleLabel = (UILabel *)[cell viewWithTag:100];
    
    [titleLabel setText:cellData];
    
    return cell;
    
}

@end
