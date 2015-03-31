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
    [categories addObject:[[AphasiaCategory alloc] initWithName:@"category_a" andImage:@"category_emotion.png" andAudio:@"audioTest"]];
    [categories addObject:[[AphasiaCategory alloc] initWithName:@"category_b" andImage:@"category_emotion.png" andAudio:@"audioTest"]];
    [categories addObject:[[AphasiaCategory alloc] initWithName:@"category_c" andImage:@"category_emotion.png" andAudio:@"audioTest"]];
    [categories addObject:[[AphasiaCategory alloc] initWithName:@"category_d" andImage:@"category_emotion.png" andAudio:@"audioTest"]];
    [categories addObject:[[AphasiaCategory alloc] initWithName:@"category_e" andImage:@"category_emotion.png" andAudio:@"audioTest"]];
    
    for (id category in categories) {
        [category restoreToDefaultElements];
    }
}

+ (void)addCategoryWithName:(NSString *)categoryName {
    [categories addObject:[[AphasiaCategory alloc] initWithName:categoryName andImage:@"category_emotion.png" andAudio:@"audio0"]];
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
