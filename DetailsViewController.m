//
//  DetailsViewController.m
//  Aphasia
//
//  Created by Elias Ayache on 29/03/15.
//  Copyright (c) 2015 B-B-BOOM!. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *barButton;

@property (nonatomic) BOOL trashIsEnable;

@property (nonatomic) NSMutableArray *selectedElements;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view
    
    self.navigationItem.title = self.detailModal.categoryName;
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    [self setTrashEnabled:NO];
    
    
    self.collectionView.allowsMultipleSelection = YES;
    
     self.barButton =  self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(onTrashButtonTouched:)];
    
    self.selectedElements = [[NSMutableArray alloc]init];
    
}

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

-(NSInteger)collectionView:(UICollectionView *)collectionView
    numberOfItemsInSection:(NSInteger)section
{
    return [[self.detailModal listOfElements] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"DetailCell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    UIImageView *elementCellImage = (UIImageView *)[cell viewWithTag:100];
    elementCellImage.image = [UIImage imageNamed:[self.detailModal getElementAtIndex:[indexPath row]].imageName];
    
  /*  if ([cell isSelected]) {
        cell.backgroundColor = [UIColor grayColor];
    }else{
        cell.backgroundColor = [UIColor whiteColor];
    }*/
    
    
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(7, 7, 7, 7);
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if (self.trashIsEnable) {
        return NO;
    } else {
        return YES;
    }
}

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

-(void)removeDetailCells{
    
    
    for(id remove in self.selectedElements){
        [self.detailModal removeElementWithIndex:[remove unsignedIntegerValue]];
        [self.collectionView reloadData];
        
    }
  
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //has one element selected
    
        NSLog(@"select");
    
    [self setTrashEnabled:YES];

        // Determine the selected items by using the indexPath
        NSNumber *selectedElement = [NSNumber numberWithInteger:[indexPath row]];
        // Add the selected item into the array
        [self.selectedElements addObject:selectedElement];
    
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSNumber *deSelectedElement = [NSNumber numberWithInteger:[indexPath row]];
    [self.selectedElements removeObject:deSelectedElement];
    
    if([self.selectedElements count]>0){
        [self setTrashEnabled:YES];
        
    }else{
        [self setTrashEnabled:NO];
    }
    
}



@end
