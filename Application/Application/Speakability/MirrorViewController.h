// Speakability - Final Year Project
// Author: Andrew Raynes
// Tutor: Baihua Li
// Developed from October 2013 to March 2014


#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import <QuartzCore/QuartzCore.h>
#import <CoreImage/CoreImage.h>


@interface MirrorViewController : UIViewController <UIAlertViewDelegate>
@property (strong) NSNumber * index;
@property (strong, nonatomic) IBOutlet UIView *previewView;
@property (strong, nonatomic) AVCaptureSession *session;
@property (strong) AVCaptureDevice *videoDevice;
@property (strong) AVCaptureDeviceInput *videoInput;
@property (strong) AVCaptureStillImageOutput *stillImageOutput;
@property BOOL isUsingFrontFacingCamera;

- (AVCaptureDevice *) backCamera;
- (AVCaptureDevice *) frontCamera;

- (IBAction)informationAlert10:(id)sender;
//Tutorial Video
-(IBAction)tutorial_2;
@property (strong, nonatomic) IBOutlet UIProgressView *progressView;
@end
