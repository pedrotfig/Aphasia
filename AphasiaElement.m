//
//  AphasiaElement.m
//  Aphasia
//
//  Created by Juliana Salgado on 31/03/15.
//  Copyright (c) 2015 B-B-BOOM!. All rights reserved.
//

#import "AphasiaElement.h"

@interface AphasiaElement ()

@property (readwrite, copy, nonatomic) NSString *name;
@property (readwrite, copy, nonatomic) NSString *imageName;
@property (readwrite, copy, nonatomic) NSString *audioName;

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

- (NSString *)getName {
    // USE NSLOCALIZABLE STRING
    return self.name;
}

- (NSString *)getImageName {
    return self.imageName;
}

- (NSString *)getAudioName {
    return self.audioName;
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
