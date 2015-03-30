//
//  Data.m
//  Aphasia
//
//  Created by Pedro Figueiredo on 3/30/15.
//  Copyright (c) 2015 B-B-BOOM!. All rights reserved.
//

#import "ImagesDataStructureNode.h"

@interface ImagesDataStructureNode ()

@property (strong, nonatomic) NSString *imageName;
@property (nonatomic) NSUInteger category;
@property (strong, nonatomic) NSMutableArray *accessibleNodes;

@end

@implementation ImagesDataStructureNode

- (void)addAccessibleNodeWithNode:(ImagesDataStructureNode *)node {
    [self.accessibleNodes addObject:node];
}

- (void)setImageName:(NSString *)imageName {
    self.imageName = imageName;
}

- (instancetype)initWithImage:(NSString *)imageName {
    self = [super init];
    if (self) {
        [self setImageName:imageName];
        self.accessibleNodes = [[NSMutableArray alloc] init];
    }
    return self;
}

- (instancetype)init {
    return [self initWithImage:@""];
}

@end
