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

- (void)initializeDataStructure {
    BoardStructureNode *node;
    for (id category in self.categories) {
        for (id element in category) {
            node = [[BoardStructureNode alloc] initWithElement:element];
        }
    }
    
}

- (NSUInteger)getNumberOfPages {
    div_t result;
    result = div([self.categories count], self.imagesPerPage);
    
    if (result.rem == 0) return result.quot;
    else return result.quot + 1;
}

- (void)setImagesPerPage:(NSUInteger)imagesPerPage {
    _imagesPerPage = imagesPerPage;
}

- (void)setCategories:(NSArray *)categories {
    _categories = [[NSArray alloc] initWithArray:categories];
}

- (instancetype)initWithCategories:(NSArray *)categories andImagesPerPage:(NSUInteger)imagesPerPage {
    self = [super init];
    if (self) {
        [self setCategories:categories];
        [self setImagesPerPage:imagesPerPage];
        [self initializeDataStructure];
    }
    return self;
}

- (instancetype)init {
    return [self initWithCategories:[[NSArray alloc] init] andImagesPerPage:DEFAULT_IMAGES_PER_PAGE];
}


@end
