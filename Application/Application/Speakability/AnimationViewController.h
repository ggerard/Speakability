// Speakability - Final Year Project
// Author: Andrew Raynes
// Tutor: Baihua Li
// Developed from October 2013 to March 2014

#import <UIKit/UIKit.h>
#import <CoreImage/CoreImage.h>
#import "LazyAnimatedImageView.h"
#import <AudioToolbox/AudioToolbox.h>

@interface AnimationViewController : UIViewController  {
    
    SystemSoundID SoundID;
    IBOutlet LazyAnimatedImageView *exercise1;
    IBOutlet LazyAnimatedImageView *exercise2;
    IBOutlet LazyAnimatedImageView *exercise3;
    IBOutlet LazyAnimatedImageView *exercise4;
    IBOutlet LazyAnimatedImageView *exercise5;
    IBOutlet LazyAnimatedImageView *exercise6;
    IBOutlet LazyAnimatedImageView *exercise7;
    IBOutlet LazyAnimatedImageView *exercise8;
    IBOutlet LazyAnimatedImageView *exercise9;
    
}

- (IBAction)playExerciseSound:(id)sender;
@property (retain, nonatomic) IBOutlet UIButton *playExerciseSound;

//Exercise 1
@property (strong, nonatomic) IBOutlet LazyAnimatedImageView *exercise1;
@property (retain, nonatomic) IBOutlet UIButton *exercise1Button;
- (IBAction)exercise1Button:(id)sender;

//Exercise 2
@property (strong, nonatomic) IBOutlet LazyAnimatedImageView *exercise2;
@property (retain, nonatomic) IBOutlet UIButton *exercise2Button;
- (IBAction)exercise2Button:(id)sender;

//Exercise 3
@property (strong, nonatomic) IBOutlet LazyAnimatedImageView *exercise3;
@property (retain, nonatomic) IBOutlet UIButton *exercise3Button;
- (IBAction)exercise3Button:(id)sender;

//Exercise 4
@property (strong, nonatomic) IBOutlet LazyAnimatedImageView *exercise4;
@property (retain, nonatomic) IBOutlet UIButton *exercise4Button;
- (IBAction)exercise4Button:(id)sender;

//Exercise 5
@property (strong, nonatomic) IBOutlet LazyAnimatedImageView *exercise5;
@property (retain, nonatomic) IBOutlet UIButton *exercise5Button;
- (IBAction)exercise5Button:(id)sender;

//Exercise 6
@property (strong, nonatomic) IBOutlet LazyAnimatedImageView *exercise6;
@property (retain, nonatomic) IBOutlet UIButton *exercise6Button;
- (IBAction)exercise6Button:(id)sender;

//Exercise 7
@property (strong, nonatomic) IBOutlet LazyAnimatedImageView *exercise7;
@property (retain, nonatomic) IBOutlet UIButton *exercise7Button;
- (IBAction)exercise7Button:(id)sender;

//Exercise 8
@property (strong, nonatomic) IBOutlet LazyAnimatedImageView *exercise8;
@property (retain, nonatomic) IBOutlet UIButton *exercise8Button;
- (IBAction)exercise8Button:(id)sender;

//Exercise 9
@property (strong, nonatomic) IBOutlet LazyAnimatedImageView *exercise9;
@property (retain, nonatomic) IBOutlet UIButton *exercise9Button;
- (IBAction)exercise9Button:(id)sender;

- (IBAction)informationAlert:(id)sender;
- (IBAction)informationAlert2:(id)sender;
- (IBAction)informationAlert3:(id)sender;
- (IBAction)informationAlert4:(id)sender;
- (IBAction)informationAlert5:(id)sender;
- (IBAction)informationAlert6:(id)sender;
- (IBAction)informationAlert7:(id)sender;
- (IBAction)informationAlert8:(id)sender;
- (IBAction)informationAlert9:(id)sender;

@end
