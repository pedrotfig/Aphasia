//
//  Category.h
//  Aphasia
//
//  Created by Elias Ayache on 30/03/15.
//  Copyright (c) 2015 B-B-BOOM!. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AphasiaElement.h"

@interface AphasiaCategory : NSObject

@property (readonly, copy, nonatomic) NSString *categoryName;
@property (readonly, copy, nonatomic) NSString *imageName;
@property (readonly, copy, nonatomic) NSString *audioName;
@property (readonly, strong, nonatomic) NSArray *accessableCategories;
@property (readonly, strong, nonatomic) NSMutableArray *elements;


- (void)setCategoryName:(NSString *)categoryName;
- (void)setImageName:(NSString *)imageName;
- (void)setAudioName:(NSString *)audioName;
- (void)setAccessableCategories:(NSArray *)accessableCategories;
- (void)setElements:(NSMutableArray *)elements;

- (void)addElementWithName:(NSString *)elementName andImage:(NSString *)imageName andAudio:(NSString *)audioName;
- (void)removeElementWithIndex:(NSUInteger)elementIndex;

- (NSString *)getCategoryName;
- (NSString *)getImageName;
- (NSString *)getAudioName;
- (NSArray *)getAccessableCategories;
- (NSArray *)listOfElements;
- (AphasiaElement *)getElementAtIndex:(NSUInteger)elementIndex;

- (instancetype)initWithName:(NSString *)categoryName andImage:(NSString *)imageName andAudio:(NSString *)audioName andRelations:(NSArray *)accessableCategories;
- (instancetype)init;

@end
