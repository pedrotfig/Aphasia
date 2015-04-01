//
//  Data.m
//  Aphasia
//
//  Created by Pedro Figueiredo on 3/30/15.
//  Copyright (c) 2015 B-B-BOOM!. All rights reserved.
//

#import "BoardStructureNode.h"

@interface BoardStructureNode ()

@property (readwrite, strong, nonatomic) AphasiaElement *element;
@property (readwrite, nonatomic) NSUInteger category;
@property (readwrite, strong, nonatomic) NSMutableArray *accessibleNodes;

@end

@implementation BoardStructureNode

- (AphasiaElement *)getElement {
    return self.element;
}

- (NSUInteger)getCategory {
    return self.category;
}

- (NSArray *)getAccessibleNodes {
    return self.accessibleNodes;
}

- (void)addAccessibleNodeWithNode:(BoardStructureNode *)node {
    [self.accessibleNodes addObject:node];
}

- (void)setElement:(AphasiaElement *)element {
    _element = element;
}

- (void)setCategory:(NSUInteger)category {
    _category = category;
}

- (void)setAccessibleNodes:(NSMutableArray *)accessibleNodes {
    _accessibleNodes = [[NSMutableArray alloc] initWithArray:accessibleNodes copyItems:YES];
}

- (instancetype)initWithElement:(AphasiaElement *)element andCategory:(NSUInteger)category {
    self = [super init];
    if (self) {
        [self setElement:element];
        [self setCategory:category];
        [self setAccessibleNodes:[[NSMutableArray alloc] init]];
    }
    return self;
}

- (instancetype)init {
    return [self initWithElement:nil andCategory:0];
}

@end
