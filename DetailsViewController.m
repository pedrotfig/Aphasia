//
//  DetailsViewController.m
//  Aphasia
//
//  Created by Elias Ayache on 29/03/15.
//  Copyright (c) 2015 B-B-BOOM!. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()
    @property (weak, nonatomic) IBOutlet UIBarButtonItem *addBarButton;

  @property (weak, nonatomic) IBOutlet UIBarButtonItem *trashBarButton;

    @property (nonatomic) BOOL trashEnabled;

    @property (nonatomic) NSMutableArray *selectedElements;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view
    
    self.navigationItem.title = self.detailModal.categoryName;
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    
    self.collectionView.allowsMultipleSelection = YES;
    
     self.trashBarButton =  self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(onTrashButtonTouched:)];
    
    //set bar itens
    self.addBarButton.enabled = YES;
    self.addBarButton.enabled = YES;
    self.trashEnabled = NO;
    self.trashBarButton.enabled= NO;
    
    self.selectedElements = [[NSMutableArray alloc]init];
    
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
    
    //cell.backgroundView = [UIColor whiteColor];
   // cell.selectedBackgroundView = [UIColor grayColor];
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(7, 7, 7, 7);
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if (self.trashEnabled) {
        return NO;
    } else {
        return YES;
    }
}

- (IBAction)onTrashButtonTouched:(id)sender {
    
    if(self.trashEnabled){
        
        if ([self.selectedElements count] > 0) {
            [self removeDetailCells];
        }
        
        // Deselect all selected items
        for(NSIndexPath *indexPath in self.collectionView.indexPathsForSelectedItems) {
            [self.collectionView deselectItemAtIndexPath:indexPath animated:NO];
        }
        
        
        
        // Remove all items from selectedRecipes array
        [self.selectedElements removeAllObjects];
        
        //set bar itens
        self.addBarButton.enabled = YES;
        self.addBarButton.enabled = YES;
        self.trashEnabled = NO;
        self.trashBarButton.enabled= NO;
        
    }else{
        
        // Change shareEnabled to YES and change the button text to DONE
        self.trashEnabled = YES;
    }
}


#pragma mark cell manipulation

-(void)removeDetailCells{
    
    
    for(id remove in self.selectedElements){
        [self.detailModal removeElementWithIndex:[remove unsignedIntegerValue]];
    }
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //has one element selected
   
    self.addBarButton.enabled = NO;
    self.addBarButton.enabled = NO;
    self.trashEnabled = YES;
    self.trashBarButton.enabled= YES;
   
    if (self.trashEnabled) {
        // Determine the selected items by using the indexPath
        NSNumber *selectedElement = [NSNumber numberWithInteger:[indexPath row]];
        // Add the selected item into the array
        [self.selectedElements addObject:selectedElement];
    }
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if([self.selectedElements count]>0){
        self.addBarButton.enabled = NO;
        self.addBarButton.enabled = NO;
        self.trashEnabled = YES;
        self.trashBarButton.enabled= YES;
        
        
        
    }else{
        self.addBarButton.enabled = YES;
        self.addBarButton.enabled = YES;
        self.trashEnabled = NO;
        self.trashBarButton.enabled= NO;
    }
    
    AphasiaElement *deSelectedElement = [self.detailModal getElementAtIndex:[indexPath row]];
    [self.selectedElements removeObject:deSelectedElement];
    
}



@end
