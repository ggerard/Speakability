// Speakability - Final Year Project
// Author: Andrew Raynes
// Tutor: Baihua Li
// Developed from October 2013 to March 2014

#import "WordTalkViewController.h"
#import "CTAppDelegate.h"
#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)

@interface WordTalkViewController ()
{
    CTAppDelegate* delegate;
    AVAudioRecorder *micInput, *recorder;
    float lowPassResults;
    bool thresholdExceeded;
    NSTimer *levelTimer;
}
@end


@implementation WordTalkViewController
@synthesize LbIProgress;
@synthesize scrollView_WordTalk;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Quick Quotes Scroll
    [scrollView_WordTalk setScrollEnabled:YES];
    [scrollView_WordTalk  setContentSize:CGSizeMake(320, 720)];
    
    delegate = (CTAppDelegate*) [[UIApplication sharedApplication] delegate];
    self.speechSynthesizer = [[AVSpeechSynthesizer alloc]init];
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapFound)];
    [self.view addGestureRecognizer:singleTap];
    
    // implicitly initializes your audio session
    
    NSError *error = nil;
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayAndRecord error:&error];
    
    [[AVAudioSession sharedInstance] overrideOutputAudioPort:AVAudioSessionPortOverrideSpeaker
                                                       error:&error];

    
    NSURL *url = [NSURL fileURLWithPath:@"/dev/null"];
    
    NSDictionary *settings = [NSDictionary dictionaryWithObjectsAndKeys:
                              [NSNumber numberWithFloat: 44100.0],                 AVSampleRateKey,
                              [NSNumber numberWithInt: kAudioFormatAppleLossless], AVFormatIDKey,
                              [NSNumber numberWithInt: 2],                         AVNumberOfChannelsKey,
                              [NSNumber numberWithInt: AVAudioQualityMax],         AVEncoderAudioQualityKey,
                              nil];
    
    recorder = [[AVAudioRecorder alloc] initWithURL:url settings:settings error:&error];
    lowPassResults = -120.0;
    thresholdExceeded = NO;
    
    [recorder prepareToRecord];
    recorder.meteringEnabled = YES;
    [recorder record];
    levelTimer = [NSTimer scheduledTimerWithTimeInterval: 0.01 target: self selector: @selector(levelTimerCallback:) userInfo: nil repeats: YES];
}

-(void) tapFound
{
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"RandomWord"
                                                         ofType:@"plist"];
    NSMutableDictionary *plistDict = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];

    int number = arc4random() % 388;
    if(number==0)
        number=1;
    
    NSString *item = [plistDict valueForKey:[NSString stringWithFormat:@"%d", number]];
    _wordTalkLabel.text = item;
    NSLog(@"word = %@", item);
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if ( event.subtype == UIEventSubtypeMotionShake )
    {
        
        
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"RandomWord"
                                                             ofType:@"plist"];
        NSMutableDictionary *plistDict = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
        
        int number = arc4random() % 388;
        if(number==0)
            number=1;
        
        NSString *item = [plistDict valueForKey:[NSString stringWithFormat:@"%d", number]];
        _wordTalkLabel.text = item;
        NSLog(@"word = %@", item);
    }
    
    if ( [super respondsToSelector:@selector(motionEnded:withEvent:)] )
        [super motionEnded:motion withEvent:event];
}

- (BOOL)canBecomeFirstResponder
{ return YES; }


// Dispose of any resources that can be recreated.
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma Speech Manipulation

//User pressed the button titled 'Speak'
- (IBAction)speakButtonWasPressed:(id)sender
{
    [recorder pause];
    [levelTimer invalidate];
    
    [self speakText:[self.wordTalkLabel text]];
    NSLog(@"%@", [self.wordTalkLabel text]);
}


//Take the current contents of the TextView and output it through the speakers of the user's device
- (void)speakText:(NSString *)toBeSpoken{
    
    AVSpeechUtterance *utt = [AVSpeechUtterance speechUtteranceWithString:toBeSpoken];
    
    utt.rate = delegate.reading_speed;
    utt.pitchMultiplier = delegate.reading_pitch;
    utt.volume = delegate.reading_volumn;
    
    [self.speechSynthesizer speakUtterance:utt];
    
    if (recorder) {
        [recorder prepareToRecord];
        recorder.meteringEnabled = YES;
        [recorder record];
        levelTimer = [NSTimer scheduledTimerWithTimeInterval: 0.01 target: self selector: @selector(levelTimerCallback:) userInfo: nil repeats: YES];
    }
}


//Increase or decrease the rate at which the text will be spoken
- (IBAction)speechSpeedShouldChange:(id)sender
{
    UISlider *slider = (UISlider *)sender;
    NSInteger val = lround(slider.value);
    NSLog(@"%@",[NSString stringWithFormat:@"%ld",(long)val]);
}


- (void)levelTimerCallback:(NSTimer *)timer {
    //Refreshes the average and peak power meters (the meter uses a logarithmic scale
    [recorder updateMeters];
    
    const double ALPHA = 0.05;
    
    float averagePowerForChannel = [recorder averagePowerForChannel:0];
    
    //Adjust the referential
    averagePowerForChannel = averagePowerForChannel / 0.6;
    
    //Converts the values
    lowPassResults = ALPHA * averagePowerForChannel + (1.0 - ALPHA) * lowPassResults;
    
    float db = lowPassResults + 120;
    db = db < 0? 0: db;
    
    
    CGRect frame = self.LbIProgress.frame; frame.origin.y = self.view.frame.size.height - (db-28) * (self.view.frame.size.height/100.0f);
    self.LbIProgress.frame = frame;
    
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
