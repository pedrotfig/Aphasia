//
//  Category.m
//  Aphasia
//
//  Created by Elias Ayache on 30/03/15.
//  Copyright (c) 2015 B-B-BOOM!. All rights reserved.
//

#import "AphasiaCategory.h"

@interface AphasiaCategory ()

@property (nonatomic) NSString *categoryName;
@property (nonatomic) NSString *imageName;
@property (nonatomic) NSString *audioName;
@property (nonatomic) NSMutableArray *elements;

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

- (void)addElementWithName:(NSString *)elementName andImage:(id)imageName andAudio:(id)audioName {
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

- (instancetype)initWithName:(NSString *)categoryName andImage:(NSString *)imageName andAudio:(id)audioName {
    self = [super init];
    if (self) {
        [self setCategoryName:categoryName];
        [self setImageName:imageName];
        [self setAudioName:audioName];
    }
    return self;
}

- (instancetype)init {
    return [self initWithName:@"" andImage:@"" andAudio:@""];
}

@end
