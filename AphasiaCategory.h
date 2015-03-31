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

@property (readonly, nonatomic) NSString *categoryName;
@property (readonly, nonatomic) NSString *imageName;
@property (readonly, nonatomic) NSString *audioName;
@property (readonly, nonatomic) NSMutableArray *elements;

- (void)restoreToDefaultElements;
- (void)setCategoryName:(NSString *)categoryName;
- (void)setImageName:(NSString *)imageName;
- (void)setAudioName:(NSString *)audioName;
- (void)addElementWithName:(NSString *)elementName andImage:imageName andAudio:audioName;
- (void)removeElementWithIndex:(NSUInteger)elementIndex;
- (NSArray *)listOfElements;
- (AphasiaElement *)getElementAtIndex:(NSUInteger)elementIndex;
- (instancetype)initWithName:(NSString *)categoryName andImage:(NSString *)imageName andAudio:(id)audioName;
- (instancetype)init;

@end
