//
//  ImagesCollection.h
//  Aphasia
//
//  Created by Pedro Figueiredo on 3/27/15.
//  Copyright (c) 2015 B-B-BOOM!. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ImagesDataStructureNode.h"

@interface ImagesCollection : NSObject

@property (strong, readonly, nonatomic) NSArray *categories;
@property (readonly, nonatomic) NSUInteger imagesPerPage;

- (void)setCategories:(NSArray *)categories;

- (void)setImagesPerPage:(NSUInteger)imagesPerPage;

- (NSUInteger) getNumberOfPages;

- (instancetype)initWithCategories:(NSArray *)categories andImagesPerPage:(NSUInteger)imagesPerPage;

- (instancetype)init;

@end
