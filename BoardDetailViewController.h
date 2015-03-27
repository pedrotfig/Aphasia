//
//  DetailViewController.h
//  Aphasia
//
//  Created by Juliana Salgado on 27/03/15.
//  Copyright (c) 2015 B-B-BOOM!. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BoardDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end

