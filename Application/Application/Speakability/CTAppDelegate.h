// Speakability - Final Year Project
// Author: Andrew Raynes
// Tutor: Baihua Li
// Developed from October 2013 to March 2014


#import <UIKit/UIKit.h>

@interface CTAppDelegate : UIResponder <UIApplicationDelegate>
{
    NSString* language;
    NSDictionary* wordList;
    float reading_speed, reading_volumn, reading_pitch;
    int game_enable;
    UIImage *capturedImage;
}
@property (readwrite) float reading_speed, reading_volumn, reading_pitch;
@property (readwrite) int game_enable;
@property (nonatomic, retain) UIImage *capturedImage;

@property (strong, nonatomic) UIWindow *window;
-(NSString*) getWordFromLanguage:(int) index;
@end
