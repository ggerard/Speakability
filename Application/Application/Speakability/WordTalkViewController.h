// Speakability - Final Year Project
// Author: Andrew Raynes
// Tutor: Baihua Li
// Developed from October 2013 to March 2014

#import <UIKit/UIKit.h>
#include <stdlib.h>
#import <QuartzCore/QuartzCore.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>

@interface WordTalkViewController : UIViewController
<AVSpeechSynthesizerDelegate, AVAudioRecorderDelegate>

@property (strong) NSNumber * index;
@property (strong, nonatomic) AVAudioRecorder *audioRecorder;
@property (strong, nonatomic) IBOutlet UILabel *wordTalkLabel;
@property (strong, nonatomic) IBOutlet UILabel *textLabel;
@property (nonatomic, retain) AVSpeechSynthesizer *speechSynthesizer;
@property (strong, nonatomic) IBOutlet UISlider *speedSlider;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *BtnSpeak;
@property (strong, nonatomic) IBOutlet UILabel *LbIProgress; //Mic Bar


- (IBAction)speakButtonWasPressed:(id)sender;
- (void)speakText:(NSString *)toBeSpoken;
- (IBAction)speechSpeedShouldChange:(id)sender;

//Scroll
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView_WordTalk;

@end
