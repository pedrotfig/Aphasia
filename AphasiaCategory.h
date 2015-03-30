//
//  Category.h
//  Aphasia
//
//  Created by Elias Ayache on 30/03/15.
//  Copyright (c) 2015 B-B-BOOM!. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AphasiaCategory : NSObject

@property (readonly, nonatomic) NSString *categoryName;
@property (readonly, nonatomic) NSString *imageName;

- (void)setCategoryName:(NSString *)categoryName;
- (void)setImageName:(NSString *)imageName;
- (instancetype)initWithName:(NSString *)categoryName andImage:(NSString *)imageName;
- (instancetype)init;

@end
