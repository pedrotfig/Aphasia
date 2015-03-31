//
//  AphasiaElement.m
//  Aphasia
//
//  Created by Juliana Salgado on 31/03/15.
//  Copyright (c) 2015 B-B-BOOM!. All rights reserved.
//

#import "AphasiaElement.h"

@interface AphasiaElement ()

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *imageName;
@property (nonatomic) NSString *audioName;

@end

@implementation AphasiaElement

- (void)setName:(NSString *)name {
    _name = name;
}

- (void)setImageName:(NSString *)imageName {
    _imageName = imageName;
}

- (void)setAudioName:(NSString *)audioName {
    _audioName = audioName;
}

- (instancetype)initWithName:(id)name andImage:(id)imageName andAudio:(id)audioName {
    self = [super init];
    if (self) {
        [self setName:name];
        [self setImageName:imageName];
        [self setAudioName:audioName];
    }
    return self;
}

- (instancetype)init {
    return [self initWithName:@"" andImage:@"" andAudio:@""];
}

@end
