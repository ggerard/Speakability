// Speakability - Final Year Project
// Author: Andrew Raynes
// Tutor: Baihua Li
// Developed from October 2013 to March 2014


#import "CTFirstTutorialSlideViewController.h"

@interface CTFirstTutorialSlideViewController ()

@end

@implementation CTFirstTutorialSlideViewController
@synthesize accelerometer;

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
    _BGScrollView.contentSize = CGSizeMake(_BGScrollView.frame.size.width+30, _BGScrollView.frame.size.width+30);
    
    self.accelerometer = [UIAccelerometer sharedAccelerometer];
    self.accelerometer.updateInterval = 0.01;
    self.accelerometer.delegate = self;
    
    [NSTimer scheduledTimerWithTimeInterval:-1 target:self selector:@selector(tick) userInfo:nil repeats:YES];
    
}

-(void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration{
    float xx = -acceleration.x;
    float yy = (acceleration.y + 0.5f) * 2.0f;
    float accelDirX;
    if (xvelocity * -1.0f >0) {
        accelDirX = 1.0;
         }
         else{
             accelDirX = -1.0;
         }
         float newDirX;
         if (xx > 0) {
             newDirX = 1.0;
         }
         else{
             newDirX = -1.0;
         }
         float accelDirY;
         if (yvelocity * -1.0f >0) {
             accelDirY = 1.0;
              }
              else{
                  accelDirY = -1.0;
              }
              float newDirY;
              if (yy > 0) {
                  newDirY = 1.0;
              }
              else{
                  newDirY = -1.0;
              }
    if (accelDirX == newDirX) xoff = acceleration.x * 40;
    if (accelDirY == newDirY) yoff = acceleration.y * 40;
    
              
    
}

-(void)tick{
    _BGScrollView.contentOffset = CGPointMake(xoff, yoff);
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
