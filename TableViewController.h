//
//  TableViewController.h
//  Aphasia
//
//  Created by Elias Ayache on 29/03/15.
//  Copyright (c) 2015 B-B-BOOM!. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController{

IBOutlet UITextField *titleCategory;
}
@property (nonatomic, strong) NSMutableArray *Title;
@property (nonatomic, strong) NSMutableArray *Description;
@property (nonatomic, strong) NSMutableArray *Images;

@end
