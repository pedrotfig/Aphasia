//
//  Data.h
//  Aphasia
//
//  Created by Pedro Figueiredo on 3/30/15.
//  Copyright (c) 2015 B-B-BOOM!. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImagesDataStructureNode : NSObject

@property (readonly, strong, nonatomic) NSString *imageName;
@property (readonly, strong, nonatomic) NSMutableArray *accessibleNodes;

- (void)addAccessibleNodeWithNode:(ImagesDataStructureNode *)node;

- (void)setImageName:(NSString *)imageName;

- (instancetype)initWithImage:(NSString *)imageName;

- (instancetype)init;

@end
