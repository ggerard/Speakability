// Speakability - Final Year Project
// Author: Andrew Raynes
// Tutor: Baihua Li
// Developed from October 2013 to March 2014


#import <UIKit/UIKit.h>
#import "CTTutorialViewController.h"

@interface CMPageViewController : UIPageViewController <UIPageViewControllerDataSource> {
    int numberOfPages;
    
    CTTutorialViewController * currentViewController;
}
@end

