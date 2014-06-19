// Speakability - Final Year Project
// Author: Andrew Raynes
// Tutor: Baihua Li
// Developed from October 2013 to March 2014

#import "CTTabBarViewController.h"
#import "CTStatusViewController.h"
#import "CTPictureNavigationViewController.h"

@interface CTTabBarViewController ()

@end

@implementation CTTabBarViewController
@synthesize tabBar;


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
    
    //Tab bar items
    UITabBarItem *tabBarItem1 = [tabBar.items objectAtIndex:0];
    UITabBarItem *tabBarItem2 = [tabBar.items objectAtIndex:1];
    UITabBarItem *tabBarItem3 = [tabBar.items objectAtIndex:2];
    UITabBarItem *tabBarItem4 = [tabBar.items objectAtIndex:3];
    UITabBarItem *tabBarItem5 = [tabBar.items objectAtIndex:4];
    
    //Tab bar (colour, font)
    [[UITabBar appearance] setBarTintColor:[UIColor colorWithRed:199.0/255.0 green:0.0/255.0 blue:77.0/255.0 alpha:1.0]];
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"Avenir-Roman" size:10.0f],
                                                        NSForegroundColorAttributeName : [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0]
                                                        } forState:UIControlStateNormal];
    
    
    //Tab bar states
    tabBarItem1.selectedImage = [[UIImage imageNamed:@"MicSelected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
    tabBarItem1.image = [[UIImage imageNamed:@"Mic"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
    tabBarItem1.title = @"Word Talk";
    
    tabBarItem2.selectedImage = [[UIImage imageNamed:@"MirrorTalkSelectedWhite"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
    tabBarItem2.image = [[UIImage imageNamed:@"MirrorTalk"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
    tabBarItem2.title = @"Mirror Talk";
    
    tabBarItem3.selectedImage = [[UIImage imageNamed:@"Main_Icon_Selected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
    tabBarItem3.image = [[UIImage imageNamed:@"Main_Icon"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
    tabBarItem3.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    tabBarItem3.title = nil;
    
    tabBarItem4.selectedImage = [[UIImage imageNamed:@"PictureTalkSelectedWhite"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
    tabBarItem4.image = [[UIImage imageNamed:@"PictureTalk"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
   tabBarItem4.title = @"Picture Talk";
    
    
    tabBarItem5.selectedImage = [[UIImage imageNamed:@"SettingsSelected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
    tabBarItem5.image = [[UIImage imageNamed:@"Settings"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
    tabBarItem5.title = @"Settings";
    
    self.selectedIndex = 2;
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
