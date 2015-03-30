//
//  StoredData.h
//  Aphasia
//
//  Created by Elias Ayache on 30/03/15.
//  Copyright (c) 2015 B-B-BOOM!. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AphasiaCategory.h"

@interface StoredData : NSObject

+ (void)restoreToDefaultCategories;
+ (void)addCategoryWithName:(NSString *)categoryName;
+ (void)removeCategoryWithIndex:(NSUInteger)categoryIndex;
+ (NSArray *)listOfCategories;

@end
