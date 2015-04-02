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

@property (strong, nonatomic) NSString *imageAdded;

@property (strong, nonatomic) NSString *audioAdded;

@end

@implementation AddCategoryViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //allow to edit image
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
    
    //just show the button when start is pressed
    self.stopButton.hidden = YES;
    
    //allow to save audio
    
    // Set the audio file
    NSArray *pathComponents = [NSArray arrayWithObjects:
                               [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject],
                               @"MyAudioMemo.m4a",
                               nil];
    NSURL *outputFileURL = [NSURL fileURLWithPathComponents:pathComponents];
    
    NSError *error = nil;
    // Setup audio session
    AVAudioSession *session = [AVAudioSession sharedInstance];
    [session setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    
    // Define the recorder setting
    NSMutableDictionary *recordSetting = [[NSMutableDictionary alloc] init];
    
    [recordSetting setValue:[NSNumber numberWithInt:kAudioFormatMPEG4AAC] forKey:AVFormatIDKey];
    [recordSetting setValue:[NSNumber numberWithFloat:44100.0] forKey:AVSampleRateKey];
    [recordSetting setValue:[NSNumber numberWithInt: 2] forKey:AVNumberOfChannelsKey];
    
    // Initiate and prepare the recorder
    recorder = [[AVAudioRecorder alloc] initWithURL:outputFileURL settings:recordSetting error:&error];
    recorder.delegate = self;
    recorder.meteringEnabled = YES;
 
 
    //TODO future handle error
    if (error)
    {
        NSLog(@"error: %@", [error localizedDescription]);
    } else {
        [recorder prepareToRecord];
    }
    
    NSArray *dirPaths;
    NSString *docsDir;
    
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = dirPaths[0];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark images

//Gesture of changing picture
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

//handle option of change image
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        NSLog(@"Camera");
        [self.picker setSourceType:UIImagePickerControllerSourceTypeCamera];
        [self presentViewController:self.picker animated:YES completion:nil];
        
    }
    if (buttonIndex == 2) {
        NSLog(@"Photo Library");
        
        [self.picker setSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
        [self presentViewController:self.picker animated:YES completion:nil];
    }
    
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    addPhotoCategory = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    [self.imageView setImage:addPhotoCategory];
    NSURL *imagePath = [info objectForKey:@"UIImagePickerControllerReferenceURL"];
    self.imageAdded = [imagePath lastPathComponent];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark audio


- (IBAction)recordTapped:(id)sender {
    if (!recorder.recording)
    {
        self.stopButton.hidden = NO;
        self.recordButton.hidden = YES;
        [recorder record];
    }
}

//Starts recording an audio
- (IBAction)playButtonTapped:(id)sender {
    
     NSLog(@"RECORDER  %@ ",recorder.url );
    
    if (!recorder.recording){
        player = [[AVAudioPlayer alloc] initWithContentsOfURL:recorder.url error:nil];
        [player setDelegate:self];
        [player play];
    }
}

//Stops recording an audio
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
        
        NSLog(@"RECORDER  %@ ",recorder.url );
        self.audioAdded = [recorder.url absoluteString];
        
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

//handle the completion of recording
-(void)audioRecorderDidFinishRecording:(AVAudioRecorder *)recorder successfully:(BOOL)flag
{
    self.stopButton.hidden = YES;
    self.recordButton.hidden = NO;
}

-(void)audioRecorderEncodeErrorDidOccur:(AVAudioRecorder *)recorder error:(NSError *)error
{
    NSLog(@"Encode Error occurred");
}

#pragma mark save


//Store new category
- (IBAction)saveNewCategory:(id)sender {
    [StoredData addCategoryWithName:titleCategory.text andImage:self.imageAdded andAudio:self.audioAdded andRelations:nil];
    [self.navigationController popViewControllerAnimated:TRUE];
}

@end