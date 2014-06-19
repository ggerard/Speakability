// Speakability - Final Year Project
// Author: Andrew Raynes
// Tutor: Baihua Li
// Developed from October 2013 to March 2014


#import "CTAppDelegate.h"

@implementation CTAppDelegate

@synthesize reading_pitch, reading_speed, reading_volumn, game_enable;

@synthesize capturedImage;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions

{
    reading_speed = 0.3f;
    reading_volumn = 1.0f;
    reading_pitch = 1.0f;

    if([[NSUserDefaults standardUserDefaults] objectForKey:@"reading_speed"])
    {
        reading_speed = [[[NSUserDefaults standardUserDefaults] objectForKey:@"reading_speed"] floatValue];
    }
    
    if([[NSUserDefaults standardUserDefaults] objectForKey:@"reading_volumn"])
    {
        reading_volumn = [[[NSUserDefaults standardUserDefaults] objectForKey:@"reading_volumn"] floatValue];
    }
    
    if([[NSUserDefaults standardUserDefaults] objectForKey:@"reading_pitch"])
    {
        reading_pitch = [[[NSUserDefaults standardUserDefaults] objectForKey:@"reading_pitch"] floatValue];
    }
    
    language = [[NSLocale preferredLanguages] objectAtIndex:0];
    
    
    // Path to the plist (in the application bundle)
    // Existing code still in place for my attempt at supporting multiple languages via plists, uncompleted due to time contraints. To complete this all words need to be converted using Google translate and the words added to a plist. The code will then check to see what language the user is running on said device and will load all words from the required plists. Falling back to english where it is anything but Chinese or French.
    NSString *path;
    
    if ([language isEqualToString:@"en"])
        path = [[NSBundle mainBundle] pathForResource: @"ButtonToSoundController" ofType:@"plist"];
    else
        if ([language isEqualToString:@"fr"])
            path = [[NSBundle mainBundle] pathForResource:@"French_PictureTalk" ofType:@"plist"];
    
    else
        if ([language isEqualToString:@"zh-Hans"])
            path = [[NSBundle mainBundle] pathForResource:@"Chinese_Simp_PictureTalk" ofType:@"plist"];
    
    
    // Determining Storyboard identifier for first view
    NSString *storyboardID = @"LoginView";
    
    game_enable = 0;
    if([[NSUserDefaults standardUserDefaults] objectForKey:@"game_enable"])
    {
        game_enable = [[[NSUserDefaults standardUserDefaults] objectForKey:@"game_enable"] intValue];
    }
    
    if([self hasEverBeenLaunched])
    {
        storyboardID = @"DoYouWantGame"; // @"SCViewController";
        
        if(game_enable == 0)
        {
            storyboardID = @"MainView";
            
        }
    }
 
    // Build the array from the plist
    wordList = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    // Setting proper view as a rootViewController
    self.window.rootViewController = [self.window.rootViewController.storyboard instantiateViewControllerWithIdentifier:storyboardID];
    
        return YES;
};


-(NSString*) getWordFromLanguage:(int) index
{
    return [wordList valueForKey:[NSString stringWithFormat:@"%d",index]];
}

							
- (void)applicationWillResignActive:(UIApplication *)application
{
 
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    NSLog(@"%f = %f = %f", reading_speed, reading_volumn, reading_pitch);
    
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithFloat:reading_speed] forKey:@"reading_speed"];
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithFloat:reading_pitch] forKey:@"reading_pitch"];
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithFloat:reading_volumn] forKey:@"reading_volumn"];
    
    [[NSUserDefaults standardUserDefaults] synchronize];

}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    
    
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
      [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithFloat:reading_speed] forKey:@"reading_speed"];
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithFloat:reading_pitch] forKey:@"reading_pitch"];
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithFloat:reading_volumn] forKey:@"reading_volumn"];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (BOOL)hasEverBeenLaunched
{
    // A boolean which determines if app has been launched
    BOOL hasBeenLaunched;
    
    // Testing if application has launched before and if it has to show the home-login screen to login
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"HasAlreadyLaunched"]) {
        // Setting variable to YES because app has been launched before
        hasBeenLaunched = YES;
        // NSLog(@"App has been already launched");
    } else {
        // Setting variable to NO because app hasn't been launched before
        hasBeenLaunched = NO;
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"HasAlreadyLaunched"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        // NSLog(@"This is the first run ever...");
    }
    
    return hasBeenLaunched;
}


@end
