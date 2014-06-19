// Speakability - Final Year Project
// Author: Andrew Raynes
// Tutor: Baihua Li
// Developed from October 2013 to March 2014


#import "LazyAnimatedImageView.h"

@implementation LazyAnimatedImageView

- (void)startAnimating {
    
    if (_isLazyAnimating) {
        [self stopAnimating];
    }
    
    currentFrame = 0;
    repetitions = 0;
    _isLazyAnimating = YES;
    
    NSLog(@"Animation count: %f", self.animationDuration);
    lazyAnimationTimer = [NSTimer scheduledTimerWithTimeInterval:self.animationDuration / [lazyAnimationFrames count] target:self selector:@selector(updateLazyAnimation) userInfo:nil repeats:YES];
}

- (void)stopAnimating {
    _isLazyAnimating = NO;
    
    if ( lazyAnimationTimer ) {
        [lazyAnimationTimer invalidate];
        lazyAnimationTimer = nil;
    }
    
}

- (void) updateLazyAnimation {
    
    if (currentFrame >= [lazyAnimationFrames count]) {
        repetitions ++;
        currentFrame = 0;
    }
    
    if (self.animationRepeatCount != -1 && repetitions >= self.animationRepeatCount) {
        [self stopAnimating];
        return;
    }
    
    [self showLazyFrame: currentFrame];
    
    currentFrame ++;
}

- (void) showLazyFrame: (int)frame {
    
    NSString * currentImageName = lazyAnimationFrames[ frame ];
    NSString * fileName = [[currentImageName lastPathComponent] stringByDeletingPathExtension];
    NSString * extension = [currentImageName pathExtension];
    
    if ([extension isEqualToString:@""]) {
        extension = @"png";
    }
    
    
    NSString * resourcePath = [[NSBundle mainBundle] pathForResource:fileName ofType:extension];
    
    UIImage *image = [UIImage imageWithContentsOfFile:resourcePath];
    
    [self setImage: image];
    
    image = nil;
}

- (void) setAnimationImages:(NSArray *)animationImages {
    [self setAnimationImages:animationImages previewFirstFrame:NO];
}

- (void) setAnimationImages:(NSArray *)animationImages previewFirstFrame:(BOOL)firstFrame {
    lazyAnimationFrames = animationImages;
    
    if (firstFrame) {
        [self showLazyFrame:0];
    }
}

- (NSArray *)animationImages {
    return lazyAnimationFrames;
}

@end
