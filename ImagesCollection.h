//
//  ImagesCollection.h
//  Aphasia
//
//  Created by Pedro Figueiredo on 3/27/15.
//  Copyright (c) 2015 B-B-BOOM!. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImagesCollection : NSObject

@property (strong, readonly, nonatomic) NSArray *images;
@property (readonly, nonatomic) NSUInteger imagesPerPage;

- (instancetype)initWithImages:(NSArray *)images andImagesPerPage:(NSUInteger)imagesPerPage;

- (instancetype)init;

- (void)setImages:(NSArray *)images;

- (void)setImagesPerPage:(NSUInteger)imagesPerPage;

- (NSUInteger) getNumberOfPages;

#pragma mark Class Methods

+ (NSUInteger) getNumberOfPagesWithNumberOfImages:(NSUInteger)totalOfImages andImagesPerPage:(NSUInteger)imagesPerPage;

@end
