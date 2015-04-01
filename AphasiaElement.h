//
//  AphasiaElement.h
//  Aphasia
//
//  Created by Juliana Salgado on 31/03/15.
//  Copyright (c) 2015 B-B-BOOM!. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AphasiaElement : NSObject

@property (readonly, copy, nonatomic) NSString *name;
@property (readonly, copy, nonatomic) NSString *imageName;
@property (readonly, copy, nonatomic) NSString *audioName;

- (void)setName:(NSString *)name;
- (void)setImageName:(NSString *)imageName;
- (void)setAudioName:(NSString *)audioName;

- (NSString *)getName;
- (NSString *)getImageName;
- (NSString *)getAudioName;

- (instancetype)initWithName:name andImage:imageName andAudio:audioName;
- (instancetype)init;

@end
