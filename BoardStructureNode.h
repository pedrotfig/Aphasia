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

@property (readonly, copy, nonatomic) AphasiaElement *element;
@property (readonly, strong, nonatomic) NSMutableArray *accessibleNodes;

- (void)addAccessibleNodeWithNode:(BoardStructureNode *)node;

- (void)setElement:(AphasiaElement *)element;

- (void)setAccessibleNodes:(NSMutableArray *)accessibleNodes;

- (instancetype)initWithElement:(AphasiaElement *)element;

- (instancetype)init;

@end
