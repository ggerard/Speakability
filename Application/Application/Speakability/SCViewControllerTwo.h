// Speakability - Final Year Project
// Author: Andrew Raynes
// Tutor: Baihua Li
// Developed from October 2013 to March 2014


#import <UIKit/UIKit.h>

@interface SCViewController : UIViewController 
@property (weak, nonatomic) IBOutlet UIButton *BtnSkip;

@property (weak, nonatomic) IBOutlet UIButton *retakeButton;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UILabel *ClockLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityView;

- (IBAction)handleRestart:(id)sender;

@end
