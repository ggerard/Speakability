// Speakability - Final Year Project
// Author: Andrew Raynes
// Tutor: Baihua Li
// Developed from October 2013 to March 2014

#import "HappyFaceViewController.h"
#import "CTAppDelegate.h"

@interface HappyFaceViewController ()

@end

@implementation HappyFaceViewController

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
}


-(void)viewWillAppear:(BOOL)animated
{
    CTAppDelegate *delegate = (CTAppDelegate*) [[UIApplication sharedApplication] delegate];
    self.CapturedImage.image = delegate.capturedImage;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (IBAction)popSegue:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
