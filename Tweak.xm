#import <UIKit/UIKit.h>

@interface UISwipeActionPullView : UIView
@end

%hook UISwipeActionPullView

- (Class)_buttonClass {
    // Use UISwipeActionCircularButton if it exists
    Class circularButtonClass = NSClassFromString(@"UISwipeActionCircularButton");
    if (circularButtonClass) {
        return circularButtonClass;
    }
    // Fallback to original implementation
    return %orig;
}

- (void)layoutSubviews {
    %orig;
    
    // Remove background color of the pull view itself
    self.backgroundColor = [UIColor clearColor];

}
%end

