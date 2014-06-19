// Speakability - Final Year Project
// Author: Andrew Raynes
// Tutor: Baihua Li
// Developed from October 2013 to March 2014


#import "ButtonToSoundController.h"
#import "CTAppDelegate.h"

@interface ButtonToSoundController ()
{
    CTAppDelegate* delegate;
}
@end

@implementation ButtonToSoundController;
@synthesize scrollView_1;
@synthesize scrollView_2;
@synthesize scrollView_3;
@synthesize scrollView_4;
@synthesize scrollView_5;
@synthesize scrollView_6;
@synthesize scrollView_7;
@synthesize scrollView_8;
@synthesize scrollView_9;
@synthesize scrollView_10;
@synthesize animationScroll;

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
	// Do any additional setup after loading the view.
    
    delegate = (CTAppDelegate*) [[UIApplication sharedApplication] delegate];

    //Emotions Scroll
    [scrollView_1 setScrollEnabled:YES];
    [scrollView_1 setContentSize:CGSizeMake(320, 555)];
    
    //Quick Quotes Scroll
    [scrollView_2 setScrollEnabled:YES];
    [scrollView_2 setContentSize:CGSizeMake(320, 555)];
    
    //Sports Scroll
    [scrollView_3 setScrollEnabled:YES];
    [scrollView_3 setContentSize:CGSizeMake(320, 935)];

    //Fruit Scroll
    [scrollView_4 setScrollEnabled:YES];
    [scrollView_4 setContentSize:CGSizeMake(320, 555)];
    
    //People Scroll
    [scrollView_6 setScrollEnabled:YES];
    [scrollView_6 setContentSize:CGSizeMake(320, 735)];
    
    //Shape Scroll
    [scrollView_7 setScrollEnabled:YES];
    [scrollView_7 setContentSize:CGSizeMake(320, 680)];
    
    //Tap To Talk Page
    [scrollView_5 setScrollEnabled:YES];
    [scrollView_5 setContentSize:CGSizeMake(320, 325)];
    
    //Animation Scroll
    [animationScroll setScrollEnabled:YES];
    [animationScroll setContentSize:CGSizeMake(320, 2276)];
    
    //Clothing Scroll
    [scrollView_8 setScrollEnabled:YES];
    [scrollView_8 setContentSize:CGSizeMake(320, 935)];
    
    //School Scroll
    [scrollView_9 setScrollEnabled:YES];
    [scrollView_9 setContentSize:CGSizeMake(320, 810)];
    
    //Kitchen Scroll
    [scrollView_10 setScrollEnabled:YES];
    [scrollView_10 setContentSize:CGSizeMake(320, 555)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

// On image click, the image name is taken from the plist via button taggging and said word is said via AVSpeechSynthesizer
- (IBAction)imageClicked:(id)sender{
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"ButtonToSoundController" ofType:@"plist"];
    NSMutableDictionary *plistDict = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
    
    NSString *item = [plistDict valueForKey:[NSString stringWithFormat:@"%ld", (long)((UIButton*)sender).tag]];
    
    AVSpeechSynthesizer *synthesizer = [[AVSpeechSynthesizer alloc]init];
    AVSpeechUtterance *utt = [AVSpeechUtterance speechUtteranceWithString:item];
    
    utt.rate = delegate.reading_speed;
    utt.pitchMultiplier = delegate.reading_pitch;
    utt.volume = delegate.reading_volumn;
    
    [synthesizer speakUtterance:utt];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden = YES;
}

@end

