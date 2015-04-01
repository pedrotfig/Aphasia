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

    [self.addPhotoCategory setImage:[UIImage imageNamed:@"addphoto"]];
    [self.addPhotoCategory setUserInteractionEnabled:YES];
    UITapGestureRecognizer *singleTap =  [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapping:)];
    [singleTap setNumberOfTapsRequired:1];
    [self.addPhotoCategory addGestureRecognizer:singleTap];
    [self.view addSubview:self.addPhotoCategory];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)doneNewCategory:(id)sender {
    [StoredData addCategoryWithName:titleCategory.text andImage:@"category_emotion" andAudio:@"audio0" andRelations:nil];
    [self.navigationController popViewControllerAnimated:TRUE];
}

/*
- (IBAction)addPhoto:(id)sender {
 UIAlertView *alert = [[UIAlertView alloc]
 initWithTitle:@"Add photo"
 message:@"Select an option"
 delegate:self
 cancelButtonTitle:@"Cancel"
 otherButtonTitles:@"Camera",@"Photo Library", nil];
 [alert show];
 }
 -(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
 if (buttonIndex == 1) {
     NSLog(@"Camera");
     picker = [[UIImagePickerController alloc]init];
     picker.delegate = self;
     [picker setSourceType:UIImagePickerControllerSourceTypeCamera];
     [self presentViewController:picker animated:YES completion:NULL];
 }
 if (buttonIndex == 2) {
     NSLog(@"Photo Library");
 }

}
 */


-(void)singleTapping:(UIGestureRecognizer *)recognizer
{
    NSLog(@"imagem clicada");
    /*
    NSLog(@"image click");
    picker = [[UIImagePickerController alloc]init];
    picker.delegate = self;
    [picker setSourceType:UIImagePickerControllerSourceTypeCamera];
    [self presentViewController:picker animated:YES completion:NULL];
     */
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Add photo"
                          message:@"Select an option"
                          delegate:self
                          cancelButtonTitle:@"Cancel"
                          otherButtonTitles:@"Camera",@"Photo Library", nil];
    [alert show];
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        //NSLog(@"Camera");
        picker = [[UIImagePickerController alloc]init];
        picker.delegate = self;
        [picker setSourceType:UIImagePickerControllerSourceTypeCamera];
        [self presentViewController:picker animated:YES completion:NULL];
    }
    if (buttonIndex == 2) {
        //NSLog(@"Photo Library");
        picker = [[UIImagePickerController alloc]init];
        picker.delegate = self;
        [picker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        [self presentViewController:picker animated:YES completion:NULL];
    }
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    [self.addPhotoCategory setImage:image];
    [self dismissViewControllerAnimated:YES completion:NULL];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:NULL];
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
