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

@end

@implementation ImagesCollection

- (NSUInteger) getNumberOfPages {
    div_t result;
    result = div([self.images count], self.imagesPerPage);
    
    if (result.rem == 0) return result.quot;
    else return result.quot + 1;
}

- (void)setImagesPerPage:(NSUInteger)imagesPerPage {
    _imagesPerPage = imagesPerPage;
}

- (void)setImages:(NSArray *)images {
    _images = [[NSArray alloc] initWithArray:images];
}

- (instancetype)initWithImages:(NSArray *)images andImagesPerPage:(NSUInteger)imagesPerPage {
    self = [super init];
    if (self) {
        [self setImages:images];
        [self setImagesPerPage:imagesPerPage];
    }
    return self;
}

- (instancetype)init {
    return [self initWithImages:[[NSArray alloc] init] andImagesPerPage:DEFAULT_IMAGES_PER_PAGE];
}

#pragma mark Class Methods

+ (NSUInteger)getNumberOfPagesWithNumberOfImages:(NSUInteger)totalOfImages andImagesPerPage:(NSUInteger)imagesPerPage {
    
    div_t result;
    result = div(totalOfImages, imagesPerPage);
    
    if (result.rem == 0) return result.quot;
    else return result.quot + 1;
}

@end
