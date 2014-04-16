

#import "CABarMenu.h"

#define kAnimationDuration 0.3

@implementation CABarMenu {
	UINavigationBar *parentBar;
    UIView *bg;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

		    }
    return self;
}

- (id)init
{
    //Menu Size
    self = [self initWithFrame:CGRectMake(0, 0, 0, 300)];
    return self;
}



//Final Frame Of The Animation
- (CGRect)finalFrameForNavigationBar:(UINavigationBar *)bar {
	CGRect rect = CGRectMake(24.8,
							 bar.frame.origin.y + 1,
							270,
							 self.frame.size.height);
	return rect;
}

- (CGRect)initialFrameForNavigationBar:(UINavigationBar *)bar {
	CGRect rect = [self finalFrameForNavigationBar:bar];
	rect.origin.y -= rect.size.height;
	return rect;
}

- (void)showFromNavigationBar:(UINavigationBar *)bar animated:(BOOL)animated {
    
	parentBar = bar;
	if (!parentBar) {
		return;
	}
	
	[bar.superview insertSubview:self belowSubview:bar];
	
	if (animated) {
		self.frame = [self initialFrameForNavigationBar:bar];
	}
	
	
	
	void (^animations)() = ^void() {
		self.frame = [self finalFrameForNavigationBar:bar];
		
	};
	
	void (^completion)(BOOL) = ^void(BOOL finished) {
		_visible = YES;
	};
	
	if (animated) {
        
		[UIView animateWithDuration:kAnimationDuration animations:animations completion:completion];
	} else {
		animations();
		completion(YES);
	}
	
}

- (void)hideAnimated:(BOOL)animated {
	if (!parentBar) {
		return;
	}
	

	void (^animations)() = ^void() {
		self.frame = [self initialFrameForNavigationBar:parentBar];
	
		
	};
	
	void (^completion)(BOOL) = ^void(BOOL finished) {
		_visible = NO;
		[self removeFromSuperview];
	};
	
	if (animated) {
		[UIView animateWithDuration:kAnimationDuration animations:animations completion:completion];
	} else {
		animations();
		completion(YES);
	}
}

@end
