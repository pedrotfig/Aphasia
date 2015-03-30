//
//  Category.m
//  Aphasia
//
//  Created by Elias Ayache on 30/03/15.
//  Copyright (c) 2015 B-B-BOOM!. All rights reserved.
//

#import "AphasiaCategory.h"

@interface AphasiaCategory ()

@property (nonatomic) NSString *categoryName;
@property (nonatomic) NSString *imageName;

@end

@implementation AphasiaCategory

- (void)setCategoryName:(NSString *)categoryName {
    _categoryName = categoryName;
}

- (void)setImageName:(NSString *)imageName {
    _imageName = imageName;
}

- (instancetype)initWithName:(NSString *)categoryName andImage:(NSString *)imageName {
    self = [super init];
    if (self) {
        [self setCategoryName:categoryName];
        [self setImageName:imageName];
    }
    return self;
}

- (instancetype)init {
    return [self initWithName:@"" andImage:@""];
}

@end
