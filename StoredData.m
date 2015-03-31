//
//  StoredData.m
//  Aphasia
//
//  Created by Elias Ayache on 30/03/15.
//  Copyright (c) 2015 B-B-BOOM!. All rights reserved.
//

#import "StoredData.h"

@implementation StoredData

static NSMutableArray *categories;
 
+ (void)restoreToDefaultCategories {
    categories = [[NSMutableArray alloc] init];
    [self addCategoryWithName:@"category0" andImage:@"category_emotion" andAudio:@"audioTest" andRelations:@"1,2,3"];
    [self addCategoryWithName:@"category1" andImage:@"category_emotion" andAudio:@"audioTest" andRelations:@"3,4"];
    [self addCategoryWithName:@"category2" andImage:@"category_emotion" andAudio:@"audioTest" andRelations:@"1"];
    [self addCategoryWithName:@"category3" andImage:@"category_emotion" andAudio:@"audioTest" andRelations:@"4"];
    [self addCategoryWithName:@"category4" andImage:@"category_emotion" andAudio:@"audioTest" andRelations:@"None"];
    
    for (id category in categories) {
        [category restoreToDefaultElements];
    }
}

+ (void)addCategoryWithName:(NSString *)categoryName andImage:(NSString *)imageName andAudio:(NSString *)audioName andRelations:(NSString *)accessableCategories{
    [categories addObject:[[AphasiaCategory alloc] initWithName:categoryName andImage:imageName andAudio:audioName andRelations:accessableCategories]];
}

+ (void)removeCategoryWithIndex:(NSUInteger)categoryIndex {
    [categories removeObjectAtIndex:categoryIndex];
}

+ (NSArray *)listOfCategories {
    if ([categories count] > 0) return categories;
    else return [[NSArray alloc] init];
}

+ (AphasiaCategory *)getCategoryAtIndex:(NSUInteger)categoryIndex {
    return [self listOfCategories][categoryIndex];
}


@end
