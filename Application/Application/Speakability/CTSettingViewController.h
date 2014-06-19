// Speakability - Final Year Project
// Author: Andrew Raynes
// Tutor: Baihua Li
// Developed from October 2013 to March 2014


#import <UIKit/UIKit.h>

@interface CTSettingViewController : UIViewController


@property (strong) NSNumber * index;


@property (weak, nonatomic) IBOutlet UISlider *SliderReadingSpeed;
@property (weak, nonatomic) IBOutlet UISlider *SliderReadingVolumn;
@property (weak, nonatomic) IBOutlet UISlider *SliderReadingPitch;
@property (weak, nonatomic) IBOutlet UISwitch *GameSwitch;


- (IBAction)readingSpeedChanged:(id)sender;
- (IBAction)readingVolumnChanged:(id)sender;
- (IBAction)readingPitchChanged:(id)sender;
- (IBAction)GameOnOff:(id)sender;


- (IBAction)showActivityView:(id)sender;


@property (strong, nonatomic) IBOutlet UIScrollView *scrollView_Settings;

@end
