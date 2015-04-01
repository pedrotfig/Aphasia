//
//  AddCategoryViewController.h
//  Aphasia
//
//  Created by Elias Ayache on 30/03/15.
//  Copyright (c) 2015 B-B-BOOM!. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StoredData.h"

@interface AddCategoryViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>{
    IBOutlet UITextField *titleCategory;
    UIImage *addPhotoCategory;
}

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
