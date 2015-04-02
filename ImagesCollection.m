//
//  ImagesCollection.m
//  Aphasia
//
//  Created by Pedro Figueiredo on 3/27/15.
//  Copyright (c) 2015 B-B-BOOM!. All rights reserved.
//

#define DEFAULT_IMAGES_PER_PAGE 6

#import "ImagesCollection.h"

@interface ImagesCollection()

@property (readwrite, strong, nonatomic) NSArray *categories;
@property (readwrite, nonatomic) NSUInteger imagesPerPage;

@end

@implementation ImagesCollection

- (void)initializeBoardNodes {
    NSMutableArray *nodes = [[NSMutableArray alloc] init];
    
    // Creating the nodes
    for (int i = 0; i < [self.categories count]; i++) {
        for (id element in [self.categories[i] listOfElements]) {
            [nodes addObject:[[BoardStructureNode alloc] initWithElement:element andCategory:i]];
        }
    }
    
    // Creating the relarions between nodes
    for (id node in nodes) {
        for (id accessableCategory in [self.categories[[node getCategory]] getAccessableCategories]) {
            for (id otherNode in nodes) {
                if ([otherNode getCategory] == [accessableCategory unsignedIntegerValue]) {
                    [node addAccessibleNodeWithNode:otherNode];
                }
            }
        }
    }
    
    [self setBoardNodes:nodes];
}

- (NSUInteger)getNumberOfPages {
    div_t result;
    result = div([self.categories count], self.imagesPerPage);
    
    if (result.rem == 0) return result.quot;
    else return result.quot + 1;
}

- (NSArray *)listOfBoardNodes {
    return self.boardNodes;
}

- (NSArray *)listOfBoardNodesInCategoriesByIndexes:(NSArray *)categoriesIndexes {
    NSMutableArray *nodesInCategories = [[NSMutableArray alloc] init];
    
    for (id categoryIndex in categoriesIndexes) {
        for (id node in [self listOfBoardNodes]) {
            if ([node getCategory] == [categoryIndex unsignedIntegerValue]) {
                [nodesInCategories addObject:node];
            }
        }
    }
    
    return [[NSArray alloc] initWithArray:nodesInCategories];
}

- (void)setImagesPerPage:(NSUInteger)imagesPerPage {
    _imagesPerPage = imagesPerPage;
}

- (void)setCategories:(NSArray *)categories {
    _categories = [[NSArray alloc] initWithArray:categories];
}

- (void)setBoardNodes:(NSArray *)boardNodes {
    _boardNodes = [[NSArray alloc] initWithArray:boardNodes];
}

- (instancetype)initWithCategories:(NSArray *)categories andImagesPerPage:(NSUInteger)imagesPerPage {
    self = [super init];
    if (self) {
        [self setCategories:categories];
        [self setImagesPerPage:imagesPerPage];
        [self initializeBoardNodes];
    }
    return self;
}

- (instancetype)init {
    return [self initWithCategories:[[NSArray alloc] init] andImagesPerPage:DEFAULT_IMAGES_PER_PAGE];
}


@end
