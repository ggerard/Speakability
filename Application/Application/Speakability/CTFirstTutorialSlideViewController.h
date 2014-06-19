// Speakability - Final Year Project
// Author: Andrew Raynes
// Tutor: Baihua Li
// Developed from October 2013 to March 2014


#import <UIKit/UIKit.h>

@interface CTFirstTutorialSlideViewController : UIViewController <UIAccelerometerDelegate> {UIAccelerometer *accelerometer;
    float xoff;
    float yoff;
    float xvelocity;
    float yvelocity;
    float xaccel;
    float yaccel;
    
}

@property (nonatomic, retain) UIAccelerometer *accelerometer;
@property (weak, nonatomic) IBOutlet UIScrollView *BGScrollView;



@end
