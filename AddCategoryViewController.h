//
//  AddCategoryViewController.h
//  Aphasia
//
//  Created by Elias Ayache on 30/03/15.
//  Copyright (c) 2015 B-B-BOOM!. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StoredData.h"

@interface AddCategoryViewController : UIViewController{
    IBOutlet UITextField *titleCategory;
}

-(IBAction)submit;

@end
