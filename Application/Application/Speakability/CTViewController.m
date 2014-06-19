// Speakability - Final Year Project
// Author: Andrew Raynes
// Tutor: Baihua Li
// Developed from October 2013 to March 2014


#import "CTViewController.h"
#import "CTAppDelegate.h"

@interface UIViewController ()
@end


@implementation CTViewController
{
    CTAppDelegate* delegate;
}

@synthesize webView;
@synthesize webView_2;
@synthesize webView_3;
@synthesize scrollView_About;
@synthesize textView;
@synthesize activity;


-(void) viewDidAppear:(BOOL)animated
{
    if([self.tabBarController selectedIndex]==0)
    {
        self.navigationItem.title = @"Type Talk";
    }
    else if([self.tabBarController selectedIndex]==1)
    {
        self.navigationItem.title = @"Picture Talk";
    }
    else if([self.tabBarController selectedIndex]==2)
    {
        self.navigationItem.title = @"Mirror Talk";
    }
    else if([self.tabBarController selectedIndex]==3)
    {
        self.navigationItem.title = @"Setting";
    }
}

-(void) viewWillAppear:(BOOL)animated
{
    if([self.tabBarController selectedIndex]==0)
    {
        self.navigationItem.title = @"Type Talk";
    }
    else if([self.tabBarController selectedIndex]==1)
    {
        self.navigationItem.title = @"Picture Talk";
    }
    else if([self.tabBarController selectedIndex]==2)
    {
        self.navigationItem.title = @"Mirror Talk";
    }
    else if([self.tabBarController selectedIndex]==3)
    {
        self.navigationItem.title = @"Setting";
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    delegate = (CTAppDelegate*) [[UIApplication sharedApplication] delegate];
    
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButtonItem;

        
    //WebView Loading Indicator, All Web Views
    timer=[NSTimer scheduledTimerWithTimeInterval:(1.0/0.1) target:self selector:@selector(loading) userInfo:nil repeats:YES];
    
    
    //Add border to TextBox
    [self.textView.layer setBorderWidth:.0f];
    [self.textView.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    [self.textView setDelegate:self];
    
    //Instantiate the object that will allow us to use text to speech
    self.speechSynthesizer = [[AVSpeechSynthesizer alloc] init];
    [self.speechSynthesizer setDelegate:self];
    
    //WebView_1 - Speakability site
    NSString *fullURL=@"http://www.speakability.co";
    NSURL *url=[NSURL URLWithString:fullURL];
    NSURLRequest*requestObj=[NSURLRequest requestWithURL:url];
    [webView loadRequest:requestObj];
    
    //WebView_2 - Cloud team site
    NSString *SecondURL=@"http://www.cloudteaminc.com";
    NSURL *url2=[NSURL URLWithString:SecondURL];
    NSURLRequest*requestSecond=[NSURLRequest requestWithURL:url2];
    [webView_2 loadRequest:requestSecond];
    
    //WebView_3 - Twitter account
    NSString *ThirdURL=@"https://twitter.com/speakability1";
    NSURL *url3=[NSURL URLWithString:ThirdURL];
    NSURLRequest*requestThird=[NSURLRequest requestWithURL:url3];
    [webView_3 loadRequest:requestThird];
    
    //About page scroll
    [scrollView_About setScrollEnabled:YES];
    [scrollView_About setContentSize:CGSizeMake(320, 590)];
    

}
-(void)willAppear:(BOOL)animated{
    NSUserDefaults *textDef = [NSUserDefaults standardUserDefaults];
    NSString *theText = [textDef stringForKey:@"myText"];
    textView.text = theText;
}

-(void)willDisappear:(BOOL)animtaed{
    NSString *textOfTextView = textView.text;
    [[NSUserDefaults standardUserDefaults] setObject:textOfTextView forKey:@"MyText"];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Dismiss the keyboard when the user presses done
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    BOOL retval = TRUE;
    if([text isEqualToString:@"\n"]){
        [self.textView resignFirstResponder];
        retval = FALSE;
    }
    return retval;
}

#pragma Speech Manipulation


//User pressed the button titled 'Speak'
- (IBAction)speakButtonWasPressed:(id)sender{
    [self speakText:[self.textView text]];
    NSLog(@"%@", [self.textView text]);
}


//Take the current contents of the TextView and output it through the speakers of the user's device
- (void)speakText:(NSString *)toBeSpoken{
    
    AVSpeechUtterance *utt = [AVSpeechUtterance speechUtteranceWithString:toBeSpoken];
    
    utt.rate = delegate.reading_speed;
    utt.pitchMultiplier = delegate.reading_pitch;
    utt.volume = delegate.reading_volumn;
    
    [self.speechSynthesizer speakUtterance:utt];
}


//Increase or decrease the rate at which the text will be spoken
- (IBAction)speechSpeedShouldChange:(id)sender
{
    UISlider *slider = (UISlider *)sender;
    NSInteger val = lround(slider.value);
    NSLog(@"%@",[NSString stringWithFormat:@"%ld",(long)val]);

}

// On image click, the image name is taken from the plist via button taggging and said word is said via AVSpeechSynthesizer
- (IBAction)imageClickedWords:(id)sender{
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"CTViewController" ofType:@"plist"];
    NSMutableDictionary *plistDict = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
    
    NSString *item = [plistDict valueForKey:[NSString stringWithFormat:@"%ld", (long)((UIButton*)sender).tag]];
    
    AVSpeechSynthesizer *synthesizer = [[AVSpeechSynthesizer alloc]init];
    AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:item];
    [utterance setRate:0.2f];
    [synthesizer speakUtterance:utterance];
}

//Share image and text
- (IBAction)showActivityView:(id)sender {
    NSString *shareText = @"Check out Speakability! I use Speakability to speak through 100's of images. http://www.speakabilityapp.com";
    UIImage *shareImage = [UIImage imageNamed:@"ShareImage@2x.png"];
    NSArray *itemsToShare = @[shareText, shareImage];
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:itemsToShare applicationActivities:nil];
    
    activityVC.excludedActivityTypes = @[UIActivityTypeCopyToPasteboard, UIActivityTypeAssignToContact, UIActivityTypePrint, UIActivityTypeSaveToCameraRoll];
    [self presentViewController:activityVC animated:YES completion:nil];
    
}

//Type to Talk - Tutorial 1
//Code in place for the future, addition of tutorials showing the user how to use each item
-(IBAction)tutorial_1 {
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                         pathForResource:@"Type To Talk" ofType:@"mov"]];
    MPMoviePlayerViewController *playercontroller = [[MPMoviePlayerViewController alloc]
                                                     initWithContentURL:url];
    [self presentViewController:playercontroller animated:NO completion:nil];
    playercontroller.moviePlayer.movieSourceType = MPMovieSourceTypeFile;
    [playercontroller.moviePlayer play];
    playercontroller = nil;
}

//Mirror Talk - Tutorial 3
//Code in place for the future, addition of tutorials showing the user how to use each item
-(IBAction)tutorial_3 {
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                         pathForResource:@"Type To Talk" ofType:@"mov"]];
    MPMoviePlayerViewController *playercontroller = [[MPMoviePlayerViewController alloc]
                                                     initWithContentURL:url];
    [self presentViewController:playercontroller animated:NO completion:nil];
    playercontroller.moviePlayer.movieSourceType = MPMovieSourceTypeFile;
    [playercontroller.moviePlayer play];
    playercontroller = nil;
}

//Loading symbol while the website loads
-(void)loading {
    if (!webView_3.loading)
        [activity stopAnimating];
    else
        [activity startAnimating];
    
}
//Loading symbol while the website loads
-(void)loading_2 {
    if (!webView_2.loading)
        [activity stopAnimating];
    else
        [activity startAnimating];
}
//Loading symbol while the website loads
-(void)loading_3 {
    if (!webView_3.loading)
        [activity stopAnimating];
    else
        [activity startAnimating];
    
}
//status bar style
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;


}


@end