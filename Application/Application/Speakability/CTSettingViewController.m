// Speakability - Final Year Project
// Author: Andrew Raynes
// Tutor: Baihua Li
// Developed from October 2013 to March 2014


#import "CTSettingViewController.h"
#import "CTAppDelegate.h"

@interface CTSettingViewController ()
{
    CTAppDelegate *delegate;
}
@end


@implementation CTSettingViewController
@synthesize scrollView_Settings;


- (void)viewDidLoad
{
    [super viewDidLoad];

    delegate = (CTAppDelegate*) [[UIApplication sharedApplication] delegate];
    
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButtonItem;
    
    _SliderReadingSpeed.value = delegate.reading_speed;
    _SliderReadingPitch.value = delegate.reading_pitch;
    _SliderReadingVolumn.value = delegate.reading_volumn;
    
    if(delegate.game_enable==0)
        _GameSwitch.on = FALSE;
    else
        _GameSwitch.on = YES;
    
    //Settings Scroll
    [scrollView_Settings setScrollEnabled:YES];
    [scrollView_Settings setContentSize:CGSizeMake(320, 550)];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

- (IBAction)readingSpeedChanged:(id)sender
{
    UISlider *slider = (UISlider *)sender;
    delegate.reading_speed = slider.value;
    NSLog(@"%@",[NSString stringWithFormat:@"%f", delegate.reading_speed]);
}

- (IBAction)readingVolumnChanged:(id)sender
{
    UISlider *slider = (UISlider *)sender;
    delegate.reading_volumn = slider.value;
    NSLog(@"%@",[NSString stringWithFormat:@"%f", delegate.reading_volumn]);
}

- (IBAction)readingPitchChanged:(id)sender
{
    UISlider *slider = (UISlider *)sender;
    delegate.reading_pitch = slider.value;
    NSLog(@"%@",[NSString stringWithFormat:@"%f",delegate.reading_pitch]);
}

- (IBAction)GameOnOff:(id)sender
{
    if(((UISwitch*)sender).isOn)
        [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInt:1] forKey:@"game_enable"];
    else
        [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInt:0] forKey:@"game_enable"];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}


//Share image and text
- (IBAction)showActivityView:(id)sender {
    NSString *shareText = @"Check out Speakability! I use Speakability to speak through 100's of images. https://itunes.apple.com/us/app/speakability/id784509467?mt=8";
    UIImage *shareImage = [UIImage imageNamed:@"ShareImage@2x.png"];
    NSArray *itemsToShare = @[shareText, shareImage];
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:itemsToShare applicationActivities:nil];
    
    activityVC.excludedActivityTypes = @[UIActivityTypeCopyToPasteboard, UIActivityTypeAssignToContact, UIActivityTypePrint, UIActivityTypeSaveToCameraRoll];
    [self presentViewController:activityVC animated:YES completion:nil];
    
}
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
@end
