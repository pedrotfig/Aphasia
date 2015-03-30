//
//  BoardViewerViewController.h
//  Aphasia
//
//  Created by Pedro Figueiredo on 3/25/15.
//  Copyright (c) 2015 B-B-BOOM!. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImagesCollection.h"

@interface BoardViewerViewController : UIViewController

@property (readonly, strong, nonatomic) NSArray *caregoriesForTesting;
@property (readonly, strong, nonatomic) NSArray *imagesForTesting;

@end
