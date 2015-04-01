//
//  Data.m
//  Aphasia
//
//  Created by Pedro Figueiredo on 3/30/15.
//  Copyright (c) 2015 B-B-BOOM!. All rights reserved.
//

#import "BoardStructureNode.h"

@interface BoardStructureNode ()

@property (readwrite, copy, nonatomic) NSString *imageName;
@property (readwrite, strong, nonatomic) NSMutableArray *accessibleNodes;

@property (readwrite, nonatomic) NSUInteger category;

@end

@implementation BoardStructureNode

- (void)addAccessibleNodeWithNode:(BoardStructureNode *)node {
    [self.accessibleNodes addObject:node];
}

- (void)setElement:(AphasiaElement *)element {
    _element = element;
}

- (void)setAccessibleNodes:(NSMutableArray *)accessibleNodes {
    _accessibleNodes = [[NSMutableArray alloc] initWithArray:accessibleNodes copyItems:YES];
}

- (instancetype)initWithElement:(AphasiaElement *)element {
    self = [super init];
    if (self) {
        [self setElement:element];
        [self setAccessibleNodes:[[NSMutableArray alloc] init]];
    }
    return self;
}

- (instancetype)init {
    return [self initWithElement:nil];
}

@end
