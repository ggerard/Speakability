// Speakability - Final Year Project
// Author: Andrew Raynes
// Tutor: Baihua Li
// Developed from October 2013 to March 2014


#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>

@interface CTViewController : UIViewController <AVSpeechSynthesizerDelegate, UITextViewDelegate>

{
    NSTimer *timer;
    
}

@property (strong) NSNumber * index;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView_About;
@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (nonatomic, retain) AVSpeechSynthesizer *speechSynthesizer;
@property (strong, nonatomic) IBOutlet UISlider *speedSlider;

//Button Clicked Event
- (IBAction)speakButtonWasPressed:(id)sender;
- (void)speakText:(NSString *)toBeSpoken;
- (IBAction)speechSpeedShouldChange:(id)sender;

//Set up webviews
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) IBOutlet UIWebView *webView_2;
@property (strong, nonatomic) IBOutlet UIWebView *webView_3;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activity;


//Video action
-(IBAction)tutorial_1;
-(IBAction)tutorial_3;

@end
