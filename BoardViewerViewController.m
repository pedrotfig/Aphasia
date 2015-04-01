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
@property (strong, nonatomic) NSMutableArray *pages;
@property (strong, nonatomic) ImagesCollection *imagesCollection;

@property (nonatomic) NSUInteger currentPage;

@property (weak, nonatomic) IBOutlet UIButton *rightArrow;
@property (weak, nonatomic) IBOutlet UIButton *leftArrow;

@end

@implementation BoardViewerViewController

static NSArray *categoriesSelected;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Initializing imagesCollection
    self.imagesCollection = [[ImagesCollection alloc] initWithCategories:[StoredData listOfCategories] andImagesPerPage:IMAGES_PER_PAGE];
    self.currentPage = 0;
    
    // Setting Collection View and Flow Layout
    if ([categoriesSelected count] == 0) {
        categoriesSelected = @[@0];
    }
    
    [self fillPagesArray];
    
    UINib *cellNib = [UINib nibWithNibName:@"ImageCell" bundle:nil];
    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:@"cvCell"];
    [self.collectionView setUserInteractionEnabled:YES];
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onCellClicked:)];
    [singleTap setNumberOfTapsRequired:1];
    [self.collectionView addGestureRecognizer:singleTap];
    
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
    for (id node in [self.imagesCollection listOfBoardNodesInCategoriesByIndexes:categoriesSelected]) {
        [cells addObject:[NSString stringWithFormat:@"Cell %@", [[node element] getName]]];
        
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

- (void)onCellClicked:(UIGestureRecognizer *)recognizer {
    
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

@end
