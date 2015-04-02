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

@property (strong, nonatomic) UIImagePickerController *picker;


@end

@implementation AddCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.imageView setImage:[UIImage imageNamed:@"addphoto"]];
    [self.imageView setUserInteractionEnabled:YES];
    UITapGestureRecognizer *singleTap =  [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapping:)];
    [singleTap setNumberOfTapsRequired:1];
    [self.imageView addGestureRecognizer:singleTap];
    [self.view addSubview:self.imageView];
    
    self.picker = [[UIImagePickerController alloc] init];
    [self.picker setAllowsEditing:YES];
    [self.picker setDelegate:self];
    addPhotoCategory = [UIImage imageNamed:@"customPhoto"];
    
    self.stopButton.hidden = YES;
    
    NSArray *dirPaths;
    NSString *docsDir;
    
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = dirPaths[0];
    
    NSString *soundFilePath = [docsDir stringByAppendingPathComponent:@"audio"];
    
    NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
    
    NSDictionary *recordSettings = [NSDictionary
                                    dictionaryWithObjectsAndKeys:
                                    [NSNumber numberWithInt:AVAudioQualityMin],
                                    AVEncoderAudioQualityKey,
                                    [NSNumber numberWithInt:16],
                                    AVEncoderBitRateKey,
                                    [NSNumber numberWithInt: 2],
                                    AVNumberOfChannelsKey,
                                    [NSNumber numberWithFloat:44100.0],
                                    AVSampleRateKey,
                                    nil];
    
    NSError *error = nil;
    
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    [audioSession setCategory:AVAudioSessionCategoryPlayAndRecord
                        error:nil];
    
    recorder = [[AVAudioRecorder alloc]
                      initWithURL:soundFileURL
                      settings:recordSettings
                      error:&error];
    
    if (error)
    {
        NSLog(@"error: %@", [error localizedDescription]);
    } else {
        [recorder prepareToRecord];
    }    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveNewCategory:(id)sender {
    [StoredData addCategoryWithName:titleCategory.text andImage:@"customPhoto" andAudio:@"audio" andRelations:nil];
    [self.navigationController popViewControllerAnimated:TRUE];
}

-(void)singleTapping:(UIGestureRecognizer *)recognizer
{
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
        [self.picker setSourceType:UIImagePickerControllerSourceTypeCamera];
        [self presentViewController:self.picker animated:YES completion:nil];
        
    }
    if (buttonIndex == 2) {
        NSLog(@"Photo Library");
        [self.picker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        [self presentViewController:self.picker animated:YES completion:nil];
    }
    
    
}


-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    addPhotoCategory = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    [self.imageView setImage:addPhotoCategory];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)recordTapped:(id)sender {
    if (!recorder.recording)
    {
        self.stopButton.hidden = NO;
        self.recordButton.hidden = YES;
        [recorder record];
    }
}

- (IBAction)stopTapped:(id)sender {
    self.stopButton.hidden = YES;
    self.recordButton.hidden = NO;
    
    if (recorder.recording)
    {
        [recorder stop];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Done"
                                                        message: @"Successfully recording"
                                                       delegate: nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
}

-(void)audioPlayerDidFinishPlaying:
(AVAudioPlayer *)player successfully:(BOOL)flag
{
    self.stopButton.hidden = YES;
    self.recordButton.hidden = NO;
}

-(void)audioPlayerDecodeErrorDidOccur:
(AVAudioPlayer *)player
                                error:(NSError *)error
{
    NSLog(@"Decode Error occurred");
}

-(void)audioRecorderDidFinishRecording:(AVAudioRecorder *)recorder successfully:(BOOL)flag
{
}

-(void)audioRecorderEncodeErrorDidOccur:(AVAudioRecorder *)recorder error:(NSError *)error
{
    NSLog(@"Encode Error occurred");
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