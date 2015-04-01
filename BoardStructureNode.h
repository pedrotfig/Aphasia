//
//  Data.h
//  Aphasia
//
//  Created by Pedro Figueiredo on 3/30/15.
//  Copyright (c) 2015 B-B-BOOM!. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StoredData.h"

@interface BoardStructureNode : NSObject

@property (readonly, strong, nonatomic) AphasiaElement *element;
@property (readonly, nonatomic) NSUInteger category;
@property (readonly, strong, nonatomic) NSMutableArray *accessibleNodes;

- (AphasiaElement *)getElement;

- (NSUInteger)getCategory;

- (NSArray *)getAccessibleNodes;

- (void)addAccessibleNodeWithNode:(BoardStructureNode *)node;

- (void)setElement:(AphasiaElement *)element;

- (void)setCategory:(NSUInteger)category;

- (void)setAccessibleNodes:(NSMutableArray *)accessibleNodes;

- (instancetype)initWithElement:(AphasiaElement *)element andCategory:(NSUInteger)category;

- (instancetype)init;

@end
