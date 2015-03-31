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

@property (strong, nonatomic) NSArray *categories;
@property (nonatomic) NSUInteger imagesPerPage;

@end

@implementation ImagesCollection

- (void)initializeDataStructure {
    NSString *imageName;
    NSUInteger imageCategory;
    NSArray *accessibleCategories;
    
    NSArray *parsedString;
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    
    
    
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
