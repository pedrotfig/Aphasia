//
//  Data.m
//  Aphasia
//
//  Created by Pedro Figueiredo on 3/30/15.
//  Copyright (c) 2015 B-B-BOOM!. All rights reserved.
//

#import "ImagesDataStructureNode.h"

@interface ImagesDataStructureNode ()

@property (readwrite, copy, nonatomic) NSString *imageName;
@property (readwrite, strong, nonatomic) NSMutableArray *accessibleNodes;

@property (readwrite, nonatomic) NSUInteger category;

@end

@implementation ImagesDataStructureNode

- (void)addAccessibleNodeWithNode:(ImagesDataStructureNode *)node {
    [self.accessibleNodes addObject:node];
}

- (void)setImageName:(NSString *)imageName {
    _imageName = imageName;
}

- (void)setAccessibleNodes:(NSMutableArray *)accessibleNodes {
    _accessibleNodes = [[NSMutableArray alloc] initWithArray:accessibleNodes copyItems:YES];
}

- (instancetype)initWithImage:(NSString *)imageName {
    self = [super init];
    if (self) {
        [self setImageName:imageName];
        [self setAccessibleNodes:[[NSMutableArray alloc] init]];
    }
    return self;
}

- (instancetype)init {
    return [self initWithImage:@""];
}

@end
