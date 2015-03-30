//
//  DetailsViewController.h
//  Aphasia
//
//  Created by Elias Ayache on 29/03/15.
//  Copyright (c) 2015 B-B-BOOM!. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailsViewController : UICollectionViewController
<UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong,nonatomic) NSMutableArray *detailImages;

@end
