//
//  AddCategoryViewController.h
//  Aphasia
//
//  Created by Elias Ayache on 30/03/15.
//  Copyright (c) 2015 B-B-BOOM!. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "StoredData.h"

@interface AddCategoryViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate, AVAudioRecorderDelegate, AVAudioPlayerDelegate>{
    IBOutlet UITextField *titleCategory;
    UIImage *addPhotoCategory;
    
    AVAudioRecorder *recorder;
    AVAudioPlayer *player;
}

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *recordButton;
@property (weak, nonatomic) IBOutlet UIButton *stopButton;

- (IBAction)recordTapped:(id)sender;
- (IBAction)stopTapped:(id)sender;

@end
