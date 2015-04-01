//
//  ImagesCollection.h
//  Aphasia
//
//  Created by Pedro Figueiredo on 3/27/15.
//  Copyright (c) 2015 B-B-BOOM!. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BoardStructureNode.h"
#import "StoredData.h"

@interface ImagesCollection : NSObject

@property (readonly, strong, nonatomic) NSArray *categories;
@property (readonly, nonatomic) NSUInteger imagesPerPage;
@property (readonly, strong, nonatomic) NSArray *boardNodes;

- (void)setCategories:(NSArray *)categories;

- (void)setImagesPerPage:(NSUInteger)imagesPerPage;

- (void)setBoardNodes:(NSArray *)boardNodes;

- (NSUInteger)getNumberOfPages;

- (NSArray *)listOfBoardNodes;

- (NSArray *)listOfBoardNodesInCategoriesByIndexes:(NSArray *)categoriesIndexes;

- (instancetype)initWithCategories:(NSArray *)categories andImagesPerPage:(NSUInteger)imagesPerPage;

- (instancetype)init;

@end
