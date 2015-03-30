//
//  DetailsViewController.h
//  Aphasia
//
//  Created by Elias Ayache on 29/03/15.
//  Copyright (c) 2015 B-B-BOOM!. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailsViewController : UIViewController

@property (strong,nonatomic) IBOutlet UILabel *TitleLabel;
@property (strong,nonatomic) IBOutlet UILabel *DescriptionLabel;
@property (strong,nonatomic) IBOutlet UIImageView *ImageView;

@property (strong,nonatomic) NSArray *DetailModal;

@end
