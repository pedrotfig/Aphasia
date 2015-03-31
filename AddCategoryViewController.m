//
//  AddCategoryViewController.m
//  Aphasia
//
//  Created by Elias Ayache on 30/03/15.
//  Copyright (c) 2015 B-B-BOOM!. All rights reserved.
//

#import "AddCategoryViewController.h"
#import "TableViewController.h"

@interface AddCategoryViewController ()

@end

@implementation AddCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.addPhoto.layer.borderWidth = 5.0f;
    self.addPhoto.layer.borderColor = [UIColor whiteColor].CGColor;
    self.addPhoto.layer.cornerRadius = 25.0f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)doneNewCategory:(id)sender {
    [StoredData addCategoryWithName:titleCategory.text andImage:@"category_emotion" andAudio:@"audio0" andRelations:nil];
    [self.navigationController popViewControllerAnimated:TRUE];
}

- (IBAction)addPhoto:(id)sender {
    NSLog(@"addPhotoClicked");

}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

/*  
    TODO: store new category on scene transition
    To store new category, use the command:
 
    [StoredData addCategoryWithName:titleCategory.text andImage:@"category_emotion" andAudio:@"audio0"];
 */

@end
