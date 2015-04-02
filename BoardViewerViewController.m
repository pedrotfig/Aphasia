//
//  BoardViewerViewController.m
//  Aphasia
//
//  Created by Pedro Figueiredo on 3/25/15.
//  Copyright (c) 2015 B-B-BOOM!. All rights reserved.
//

#define IMAGES_PER_PAGE 6

#define RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

#define CELL_IDENTIFIER @"BoardCell"
#define UPPER_CELL_IDENTIFIER @"UpperImageCell"

#import "BoardViewerViewController.h"

@interface BoardViewerViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray *pages;
@property (strong, nonatomic) ImagesCollection *imagesCollection;

@property (nonatomic) NSUInteger currentPage;

@property (weak, nonatomic) IBOutlet UIButton *rightArrow;
@property (weak, nonatomic) IBOutlet UIButton *leftArrow;

@property (weak, nonatomic) IBOutlet UICollectionView *upperCollectionView;

@property (strong, nonatomic) NSArray *boardNodes;


@end

@implementation BoardViewerViewController

static NSArray *previousCategoriesSelected;
static NSArray *categoriesSelected;
static NSMutableArray *upperElements;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Initializing imagesCollection
    self.imagesCollection = [[ImagesCollection alloc] initWithCategories:[StoredData listOfCategories] andImagesPerPage:IMAGES_PER_PAGE];
    self.currentPage = 0;
    
    // Setting Collection View and Flow Layout
    if ([categoriesSelected count] == 0) {
        categoriesSelected = [StoredData initialCategories];
    }
    else if ([categoriesSelected[0] integerValue] == -1) {
        categoriesSelected = @[];
        
    }
    
    if ([previousCategoriesSelected count] == 0) {
        previousCategoriesSelected = [StoredData initialCategories];
    }
    
    if ([upperElements count] == 0) {
        upperElements = [[NSMutableArray alloc] init];
    }
    
    self.boardNodes = [self.imagesCollection listOfBoardNodesInCategoriesByIndexes:categoriesSelected];
    
    [self fillPagesArray];
    
    UINib *cellNib = [UINib nibWithNibName:@"ImageCell" bundle:nil];
    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:CELL_IDENTIFIER];
    [self.collectionView setUserInteractionEnabled:YES];
    
    UINib *upperCellNib = [UINib nibWithNibName:@"UpperImageCell" bundle:nil];
    [self.upperCollectionView registerNib:upperCellNib forCellWithReuseIdentifier:UPPER_CELL_IDENTIFIER];
    [self.upperCollectionView setUserInteractionEnabled:YES];
    
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
    for (id node in self.boardNodes) {
        [cells addObject:[NSString stringWithFormat:@"Cell %@", [[node getElement] getName]]];
        
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
    if (collectionView == self.collectionView) return [self.pages count];
    else return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (collectionView == self.collectionView) return [[self.pages objectAtIndex:section] count];
    else return [upperElements count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (collectionView == self.collectionView) {
        
        BoardViewerCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CELL_IDENTIFIER forIndexPath:indexPath];
        
        NSUInteger nodeIndex = [indexPath row] + (self.currentPage*IMAGES_PER_PAGE);
        NSArray *nodes = self.boardNodes;
        [cell setCorrespondingNode:nodes[nodeIndex]];
        
        cell.backgroundColor = RGB(223, 223, 223);
        AphasiaElement *cellElement = [[cell getCorrespondingNode] getElement];
        
        [cell.image setImage:[UIImage imageNamed:[cellElement getImageName]]];
        
        return cell;

    }
    else {
        BoardViewerUpperCell *upperCell = [collectionView dequeueReusableCellWithReuseIdentifier:UPPER_CELL_IDENTIFIER forIndexPath:indexPath];
        
        upperCell.backgroundColor = RGB(223, 223, 223);
        
        [upperCell.image setImage:[UIImage imageNamed:upperElements[[indexPath row]]]];
        
        return upperCell;
    }
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 5, 0, 5);
}

- (BOOL)collectionView:(UICollectionView *)collectionView
shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (BOOL)collectionView:(UICollectionView *)collectionView
shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath;
{
    if (collectionView == self.collectionView) return YES;
    else return NO;
}

//quick selected
- (void)collectionView:(UICollectionView *)colView
didHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    if (colView == self.collectionView) {
        UICollectionViewCell *cell = [colView cellForItemAtIndexPath:indexPath];
        cell.contentView.backgroundColor = [UIColor grayColor];
    }
}

- (void)collectionView:(UICollectionView *)colView
didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    if (colView == self.collectionView) {
        UICollectionViewCell *cell = [colView cellForItemAtIndexPath:indexPath];
        cell.contentView.backgroundColor = nil;
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    BoardViewerCell *cell = (BoardViewerCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    previousCategoriesSelected = [[NSArray alloc] initWithArray:categoriesSelected];
    categoriesSelected = [[StoredData getCategoryAtIndex:[[cell correspondingNode] getCategory]] getAccessableCategories];
    
    if ([categoriesSelected count] == 0) categoriesSelected = @[@(-1)];
    
    [upperElements addObject:[[[cell getCorrespondingNode] getElement] getImageName]];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    BoardViewerViewController *dest = [storyboard instantiateViewControllerWithIdentifier:@"BoardViewerViewController"];
    [self presentViewController:dest animated:YES completion:nil];
}

- (IBAction)onRightArrowClicked:(id)sender {
    if (self.currentPage+1 < [self.pages count]) {
        self.currentPage++;
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:self.currentPage] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    }
}


- (IBAction)onLeftArrowClick:(id)sender {
    categoriesSelected = [[NSArray alloc] initWithArray:previousCategoriesSelected];
    [upperElements removeLastObject];
    if (self.currentPage > 0) {
        self.currentPage--;
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:self.currentPage] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    }
    else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
