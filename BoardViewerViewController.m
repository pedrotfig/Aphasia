//
//  BoardViewerViewController.m
//  Aphasia
//
//  Created by Pedro Figueiredo on 3/25/15.
//  Copyright (c) 2015 B-B-BOOM!. All rights reserved.
//

#define IMAGES_TOTAL 16
#define IMAGES_PER_PAGE 6

#import "BoardViewerViewController.h"

@interface BoardViewerViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray *pages;
@property (strong, nonatomic) ImagesCollection *imagesCollection;

@property (nonatomic) NSUInteger currentPage;

@property (weak, nonatomic) IBOutlet UIButton *rightArrow;
@property (weak, nonatomic) IBOutlet UIButton *leftArrow;

@end

@implementation BoardViewerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
        
    // Initializing imagesCollection
    self.imagesCollection = [[ImagesCollection alloc] initWithCategories:[StoredData listOfCategories] andImagesPerPage:IMAGES_PER_PAGE];
    self.currentPage = 0;
    
    // Setting Collection View and Flow Layout
    [self fillPagesArray];
    
    UINib *cellNib = [UINib nibWithNibName:@"ImageCell" bundle:nil];
    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:@"cvCell"];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setItemSize:CGSizeMake(250, 250)];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    [self.collectionView setCollectionViewLayout:flowLayout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) fillPagesArray {
    self.pages = [[NSMutableArray alloc] init];
    NSMutableArray *cells = [[NSMutableArray alloc] init];
    int indexInPage = 0;
    for (int i=0; i<IMAGES_TOTAL; i++) {
        [cells addObject:[NSString stringWithFormat:@"Cell %d", i]];
        indexInPage++;
        if (indexInPage == self.imagesCollection.imagesPerPage) {
            [self.pages addObject:[[NSArray alloc] initWithArray:cells copyItems:YES]];
            cells = [[NSMutableArray alloc] init];
            indexInPage = 0;
        }
    }
    if ([cells count] > 0) {
        [self.pages addObject:[[NSArray alloc] initWithArray:cells copyItems:YES]];
    }
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return [self.pages count];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [[self.pages objectAtIndex:section] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSMutableArray *data = [self.pages objectAtIndex:indexPath.section];
    
    NSString *cellData = [data objectAtIndex:indexPath.row];
    
    static NSString *cellIdentifier = @"cvCell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    UILabel *titleLabel = (UILabel *)[cell viewWithTag:100];
    
    [titleLabel setText:cellData];
    
    return cell;
    
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 5, 0, 5);
}

- (IBAction)onRightArrowClicked:(id)sender {
    if (self.currentPage+1 < [self.pages count]) {
        self.currentPage++;
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:self.currentPage] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    }
}


- (IBAction)onLeftArrowClick:(id)sender {
    if (self.currentPage > 0) {
        self.currentPage--;
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:self.currentPage] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    }
    else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

/*
- (void)useImagesForTesting {
    self.caregoriesForTesting = @[
                                  @"1,2,3",
                                  @"3,4",
                                  @"1",
                                  @"4",
                                  @"None",
                                  ];
    self.imagesForTesting = @[
                              @"image0#0",
                              @"image1#0",
                              @"image2#0",
                              @"image3#1",
                              @"image4#1",
                              @"image5#2",
                              @"image6#3",
                              @"image7#4",
                              ];
    
}
*/



@end
