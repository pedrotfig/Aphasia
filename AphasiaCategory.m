//
//  Category.m
//  Aphasia
//
//  Created by Elias Ayache on 30/03/15.
//  Copyright (c) 2015 B-B-BOOM!. All rights reserved.
//

#import "AphasiaCategory.h"

@interface AphasiaCategory ()

@property (strong, nonatomic) NSString *categoryName;
@property (strong, nonatomic) NSString *imageName;
@property (strong, nonatomic) NSString *audioName;
@property (strong, nonatomic) NSString *accessableCategories;
@property (strong, nonatomic) NSMutableArray *elements;

@end

@implementation AphasiaCategory

- (void)restoreToDefaultElements {
    _elements = [[NSMutableArray alloc] init];
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

- (void)setAccessableCategories:(NSString *)relations {
    _accessableCategories = relations;
}

- (void)addElementWithName:(NSString *)elementName andImage:(NSString *)imageName andAudio:(NSString *)audioName {
    [_elements addObject:[[AphasiaElement alloc] initWithName:elementName andImage:imageName andAudio:audioName]];
}

- (void) removeElementWithIndex:(NSUInteger)elementIndex {
    [_elements removeObjectAtIndex:elementIndex];
}

- (NSArray *)listOfElements {
    return self.elements;
}

- (AphasiaElement *)getElementAtIndex:(NSUInteger)elementIndex {
    return [self listOfElements][elementIndex];
}

- (instancetype)initWithName:(NSString *)categoryName andImage:(NSString *)imageName andAudio:(id)audioName andRelations:(NSString *)accessableCategories {
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
    return [self initWithName:@"" andImage:@"" andAudio:@"" andRelations:@"0"];
}

@end
