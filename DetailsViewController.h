//
//  DetailsViewController.h
//  Aphasia
//
//  Created by Elias Ayache on 29/03/15.
//  Copyright (c) 2015 B-B-BOOM!. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StoredData.h"
#import "AddCategoryViewController.h"

@interface DetailsViewController : UICollectionViewController
<UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong,nonatomic) AphasiaCategory *detailModal;

@end
