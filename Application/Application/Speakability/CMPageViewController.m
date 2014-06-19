// Speakability - Final Year Project
// Author: Andrew Raynes
// Tutor: Baihua Li
// Developed from October 2013 to March 2014

#import "CMPageViewController.h"
#import "CTTutorialViewController.h"
#import "CTViewController.h"
#import "ButtonToSoundController.h"
#import "WordTalkViewController.h"
#import "MirrorViewController.h"
#define NUMBER_OF_PAGES 6

@interface CMPageViewController ()

- (void)adjustPageControl;

@end

@implementation CMPageViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UIPageControl *pageControl = [UIPageControl appearance];
    pageControl.pageIndicatorTintColor = [UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1.0];
    pageControl.currentPageIndicatorTintColor = [UIColor colorWithRed:199.0/255.0 green:0.0/255.0 blue:77.0/255.0 alpha:1.0];
    pageControl.backgroundColor = [UIColor clearColor];
    self.dataSource = self;
}

- (void)awakeFromNib {
    
    self.dataSource = self;
    
    numberOfPages = NUMBER_OF_PAGES;
    
    CTTutorialViewController * initialViewController = [self viewControllerAtIndex:0];
    
    NSArray *viewControllers = [NSArray arrayWithObject:initialViewController];
    
    [self setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
}

- (void)viewDidAppear:(BOOL)animated {
    [self adjustPageControl];
}

-(void)adjustPageControl {
        UIPageControl *thisControl = nil;
       for (int i=0; i<[self.view.subviews count]; i++) {
            if ([[self.view.subviews objectAtIndex:i] isKindOfClass:[UIPageControl class]]) {
                thisControl = (UIPageControl *)[self.view.subviews objectAtIndex:i];
            }
        }
    
        thisControl.frame = CGRectOffset(thisControl.frame, 0, -100);
    
        [thisControl removeFromSuperview];
        [self.parentViewController.view addSubview: thisControl];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(CTTutorialViewController *)viewController {
    
    return [self viewControllerAtIndex:[viewController.index intValue] + 1];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(CTTutorialViewController *)viewController {
    
    return [self viewControllerAtIndex:[viewController.index intValue] - 1];
}

- (CTTutorialViewController *)viewControllerAtIndex:(int)index {
    
    if ( index == NUMBER_OF_PAGES || index < 0) {
        return nil;
    }
    
    NSLog(@"Page %i", index + 1);
    
    // Create a new view controller and pass suitable data
    NSString * identifier = [NSString stringWithFormat:@"%i", index + 1];
    CTTutorialViewController * viewController = [self.storyboard instantiateViewControllerWithIdentifier:identifier];
    
    NSLog(@"Page %@", viewController);
    
    viewController.index = @(index);
    
    currentViewController = viewController;
    
    return currentViewController;
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    return  numberOfPages;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    
    return 0;
}


@end