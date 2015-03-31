//
//  Category.m
//  Aphasia
//
//  Created by Elias Ayache on 30/03/15.
//  Copyright (c) 2015 B-B-BOOM!. All rights reserved.
//

#import "AphasiaCategory.h"

@interface AphasiaCategory ()

@property (readwrite, copy, nonatomic) NSString *categoryName;
@property (readwrite, copy, nonatomic) NSString *imageName;
@property (readwrite, copy, nonatomic) NSString *audioName;
@property (readwrite, strong, nonatomic) NSArray *accessableCategories;
@property (readwrite, strong, nonatomic) NSMutableArray *elements;

@end

@implementation AphasiaCategory

- (void)restoreToDefaultElements {
    self.elements = [[NSMutableArray alloc] init];
    [self addElementWithName:@"element0" andImage:@"profile" andAudio:@"audio0"];
    [self addElementWithName:@"element1" andImage:@"profile" andAudio:@"audio0"];
    [self addElementWithName:@"element2" andImage:@"profile" andAudio:@"audio0"];
    [self addElementWithName:@"element3" andImage:@"profile" andAudio:@"audio0"];
    [self addElementWithName:@"element4" andImage:@"profile" andAudio:@"audio0"];
    [self addElementWithName:@"element5" andImage:@"profile" andAudio:@"audio0"];
    [self addElementWithName:@"element6" andImage:@"profile" andAudio:@"audio0"];
}

- (void)setCategoryName:(NSString *)categoryName {
    _categoryName = categoryName;
}

- (void)setImageName:(NSString *)imageName {
    _imageName = imageName;
}

- (void)setAudioName:(NSString *)audioName {
    _audioName = audioName;
}

- (void)setAccessableCategories:(NSArray *)accessableCategories {
    _accessableCategories = [[NSArray alloc] initWithArray:accessableCategories copyItems:YES];
}

- (void)addElementWithName:(NSString *)elementName andImage:(NSString *)imageName andAudio:(NSString *)audioName {
    [self.elements addObject:[[AphasiaElement alloc] initWithName:elementName andImage:imageName andAudio:audioName]];
}

- (void) removeElementWithIndex:(NSUInteger)elementIndex {
    [self.elements removeObjectAtIndex:elementIndex];
}

- (NSArray *)listOfElements {
    return self.elements;
}

- (AphasiaElement *)getElementAtIndex:(NSUInteger)elementIndex {
    return [self listOfElements][elementIndex];
}

- (instancetype)initWithName:(NSString *)categoryName andImage:(NSString *)imageName andAudio:(id)audioName andRelations:(NSArray *)accessableCategories {
    self = [super init];
    if (self) {
        [self setCategoryName:categoryName];
        [self setImageName:imageName];
        [self setAudioName:audioName];
        [self setAccessableCategories:accessableCategories];
    }
    return self;
}

- (instancetype)init {
    return [self initWithName:@"" andImage:@"" andAudio:@"" andRelations:nil];
}

@end
