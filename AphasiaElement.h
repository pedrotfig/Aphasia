//
//  AphasiaElement.h
//  Aphasia
//
//  Created by Juliana Salgado on 31/03/15.
//  Copyright (c) 2015 B-B-BOOM!. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AphasiaElement : NSObject

@property (readonly, nonatomic) NSString *name;
@property (readonly, nonatomic) NSString *imageName;
@property (readonly, nonatomic) NSString *audioName;

- (void)setName:(NSString *)name;
- (void)setImageName:(NSString *)imageName;
- (void)setAudioName:(NSString *)audioName;

- (instancetype)initWithName:name andImage:imageName andAudio:audioName;
- (instancetype)init;

@end
