// Speakability - Final Year Project
// Author: Andrew Raynes
// Tutor: Baihua Li
// Developed from October 2013 to March 2014


#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ButtonToSoundController : UIViewController
@property (strong) NSNumber * index;

//Image Clicked Event
- (IBAction)imageClicked:(id)sender;

//Emotions
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView_1;

//Quick Quotes
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView_2;

//Sports Scroll
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView_3;

//Food Scroll
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView_4;

//Tap To Talk Scroll
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView_5;

//People Scroll
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView_6;

//Shape Scroll
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView_7;

//Clothing Scroll
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView_8;

//School Scroll
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView_9;

//Kitchen Scroll
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView_10;

//Animation
@property (strong, nonatomic) IBOutlet UIScrollView *animationScroll;
@end
