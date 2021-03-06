//
//  DetailsViewController.m
//  Aphasia
//
//  Created by Elias Ayache on 29/03/15.
//  Copyright (c) 2015 B-B-BOOM!. All rights reserved.
//

#import "DetailsViewController.h"

#define RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *barButton;

@property (nonatomic) BOOL trashIsEnable;

@property (nonatomic) NSMutableArray *selectedElements;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    //setup after loading the view
    
    self.navigationItem.title = self.detailModal.categoryName;
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    [self setTrashEnabled:NO];
    
    
    self.collectionView.allowsMultipleSelection = YES;
    
    self.barButton =  self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(onTrashButtonTouched:)];
    
    self.selectedElements = [[NSMutableArray alloc]init];
    
}

// method that handles add or trash icon
- (void)setTrashEnabled:(BOOL)trashEnabled{
    
    
    if (trashEnabled) {
        self.trashIsEnable = YES;
        self.barButton =  self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(onTrashButtonTouched:)];
        
    }else{
        self.trashIsEnable = NO;
        self.barButton =  self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(onTrashButtonTouched:)];
    }
    
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

//get elements to show on "database"
-(NSInteger)collectionView:(UICollectionView *)collectionView
    numberOfItemsInSection:(NSInteger)section
{
    return [[self.detailModal listOfElements] count];
}

//set cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"DetailCell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    cell.backgroundColor = RGB(223, 223, 223);
    
    UIImageView *elementCellImage = (UIImageView *)[cell viewWithTag:100];
    elementCellImage.image = [UIImage imageNamed:[self.detailModal getElementAtIndex:[indexPath row]].imageName];
    
    return cell;
}

//space between cells
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(7, 7, 7, 7);
}

//handle if its treating an add event or a trash event
- (IBAction)onTrashButtonTouched:(id)sender {
    
    if(self.trashIsEnable){
        
        if ([self.selectedElements count] > 0) {
            [self removeDetailCells];
        }
        
        // Deselect all selected items
        for(NSIndexPath *indexPath in self.collectionView.indexPathsForSelectedItems) {
            [self.collectionView deselectItemAtIndexPath:indexPath animated:NO];
        }
        
        
        
        // Remove all items from selectedRecipes array
        [self.selectedElements removeAllObjects];
        
        [self setTrashEnabled:NO];
        
    }else{
        NSLog(@"adicionar");
        
        //ADD
    }
}

//highlight settings
- (BOOL)collectionView:(UICollectionView *)collectionView
shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (BOOL)collectionView:(UICollectionView *)collectionView
shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath;
{
    return YES;
}

//quick selected
- (void)collectionView:(UICollectionView *)colView
didHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell* cell = [colView cellForItemAtIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor grayColor];
}
- (void)collectionView:(UICollectionView *)colView
didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell* cell = [colView cellForItemAtIndexPath:indexPath];
    cell.contentView.backgroundColor = nil;
}

#pragma mark cell manipulation

//remove the elements selected from data
-(void)removeDetailCells{
    
    for(id remove in self.selectedElements){
        [self.detailModal removeElementWithIndex:[remove unsignedIntegerValue]];
        [self.collectionView reloadData];
        
    }
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //has one element selected so shows the trash as item bar
    
    NSLog(@"select");
    
    NSLog(@"select %lu before" , (unsigned long)[self.selectedElements count]);
    
    UICollectionViewCell* cell = [collectionView cellForItemAtIndexPath:indexPath];
    if(cell.selected){
        cell.contentView.backgroundColor = [UIColor grayColor];
    }
    
    
    [self setTrashEnabled:YES];
    
    // Determine the selected items by using the indexPath
    NSNumber *selectedElement = [NSNumber numberWithInteger:[indexPath row]];
    
    // Add the selected item into the array
    [self.selectedElements addObject:selectedElement];
    
    NSLog(@"select %lu after" , (unsigned long)[self.selectedElements count]);
    
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"deselect %lu " , (unsigned long)[self.selectedElements count]);
    
    NSNumber *deSelectedElement = [NSNumber numberWithInteger:[indexPath row]];
    [self.selectedElements removeObject:deSelectedElement];
    
    NSLog(@"deselect %lu after remove " , (unsigned long)[self.selectedElements count]);
    
    //if there is any item selected show trash item
    if([self.selectedElements count]>0){
        [self setTrashEnabled:YES];
        
    }else{
        [self setTrashEnabled:NO];
    }
    
}



@end
