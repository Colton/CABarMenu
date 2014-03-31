
#import <UIKit/UIKit.h>

@interface CABarMenu : UIToolbar

@property (nonatomic, readonly, getter=isVisible) BOOL visible;
@property (nonatomic) UIScrollView *scrollView;

- (void)showFromNavigationBar:(UINavigationBar *)bar animated:(BOOL)animated;
- (void)hideAnimated:(BOOL)animated;

@end
