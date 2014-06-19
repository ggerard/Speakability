// Speakability - Final Year Project
// Author: Andrew Raynes
// Tutor: Baihua Li
// Developed from October 2013 to March 2014


#import <UIKit/UIKit.h>

@interface LazyAnimatedImageView : UIImageView {
    int currentFrame;
    int repetitions;
    
    NSTimer * lazyAnimationTimer;
    NSArray * lazyAnimationFrames;
}

@property (readonly, assign) bool isLazyAnimating;

- (void) showLazyFrame:(int)frame;
- (void) updateLazyAnimation;
- (void) setAnimationImages:(NSArray *)animationImages previewFirstFrame:(BOOL)firstFrame;

@end
