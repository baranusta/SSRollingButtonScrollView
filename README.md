SSRollingButtonScrollView
=========================

SSRollingButtonScrollView is a custom UIScrollView subclass that features an infinite looping scroll of UIButtons. Users of SSRollingButtonScrollView must, at minimum, provide an array of button titles and specify a layout style (horizontal scrolling or vertical scrolling). Through the implementation of the optional delegate methods, the user is informed of any button being pushed (touchUpInside), any button being scrolled to the center of the view, and most of the UIScrollViewDelegate methods (some are not available as they interfere with the working of the SSRollingButtonScrollView). The inifinite scrolling code is based on Apple's InfiniteScrollView class found in the StreetScroller sample project.


How To Use
----------

1. Add the **SSRollingButtonScrollView.h** and **SSRollingButtonScrollView.m** files to your project.

2. Add the **AudioToolbox.framework** to your project.

3. Add the appropriate `#import` and `@class` statements to the view controller(s) that will be using an SSRollingButtonScrollView.

	```objectivec
	//
	// ViewController.h
	//
	
	#import <UIKit/UIKit.h>
	
	@class SSRollingButtonScrollView;
	
	@interface ViewController : UIViewController
	
	@end
	```
	
	```objectivec
	//
	//  ViewController.m
	//
	
	#import "ViewController.h"
	#import "SSRollingButtonScrollView.h"
	
	@interface ViewController ()
	
	@end
	```
      
4. Add `<SSRollingButtonScrollViewDelegate>` to your view controller's **.m** file to make it an SSRollingButtonScrollView delegate.

	```objectivec
	@interface ViewController () <SSRollingButtonScrollViewDelegate>
	```

5. In interface builder, add a UIScrollView to the view in which you want to add SSRollingButtonScrollView functionality. Set the UIScrollView's **Custom Class** to **SSRollingButtonScrollView**.  Add an `SSRollingButtonScrollView` `@property` to your view controller's **.h** file.  Connect the SSRollingButtonScrollView in interface builder to the property as a referencing outlet. 

	```objectivec
	@property (weak, nonatomic) IBOutlet SSRollingButtonScrollView *myRollingButtonScrollView;
	```

6. In the **viewDidLoad** method of your view controller, create an `NSArray` of `NSString` objects.  The strings will be the titles for the buttons. For example:

	```objectivec
	NSArray *myButtonTitles = [NSArray arrayWithObjects:@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", nil];
	```
	
7. If you wish to change the default settings of the optional properties, do so at this time. If this step is done, it must be done prior to step 8. The optional properties are shown below. A detailed description of these properties is located at the end of this document.

	```objectivec
	@property (nonatomic, strong) UIFont *buttonNotCenterFont;
	@property (nonatomic, strong) UIFont *buttonCenterFont;
	@property (nonatomic) CGFloat fixedButtonWidth;
	@property (nonatomic) CGFloat fixedButtonHeight;
	@property (nonatomic) CGFloat spacingBetweenButtons;
	@property (nonatomic, strong) UIColor *notCenterButtonTextColor;
	@property (nonatomic, strong) UIColor *centerButtonTextColor;
	@property (nonatomic, strong) UIColor *notCenterButtonBackgroundColor;
	@property (nonatomic, strong) UIColor *centerButtonBackgroundColor;
	@property (nonatomic, strong) UIImage *notCenterButtonBackgroundImage;
	@property (nonatomic, strong) UIImage *centerButtonBackgroundImage;
	@property (nonatomic) BOOL stopOnCenter;
	@property (nonatomic) BOOL centerPushedButtons;
	@property (nonatomic) BOOL playSound;
	```

8. Add a call to `createButtonArrayWithButtonTitles: andLayoutStyle:` to your view controller's **.m** file. This function requires two parameters. The first is the array of button titles that you created in step 6. The second is the layout style you wish to use.  The layout style is an enumerated type with only two options.  SShorizontalLayout for buttons that scroll horizontally and SSverticalLayout for buttons that scroll vertically.

	```objectivec
	[self.myRollingButtonScrollView createButtonArrayWithButtonTitles:myButtonTitles andLayoutStyle:SShorizontalLayout];
	```

10. If you would like your view controller to respond to the user's interaction with the SSRollingButtonScrollView, you must set your view controller as the delegate for the SSRollingButtonScrollView. 

	NOTE: USE THE **SSRollingButtonScrollView** DELEGATE ONLY!!! Do NOT set your view controller as a UIScrollView delegate!!! The SSRollingButtonScrollViewDelegate will pass on the useable UIScrollViewDelegate methods to your view controller. Setting your view controller as UIScrollView delegate will result in a loss of some of the SSRollingButtonScrollView's functionality.

	```objectivec
	self.myRollingButtonScrollView.ssRollingButtonScrollViewDelegate = self;
	```

10. You will probably want to add the following delegate methods to your **.m** file so that the SSRollingButtonScrollView can trigger actions within your view controller.

	```objectivec
	#pragma mark - SSRollingButtonScrollViewDelegate

	- (void)rollingScrollViewButtonPushed:(UIButton *)button ssRollingButtonScrollView:(SSRollingButtonScrollView *)rollingButtonScrollView
	{
    	// Insert your code for action to take when an SSRollingButtonScrollView UIButton experiences
		// a touchUpInside event.
	}

	- (void)rollingScrollViewButtonIsInCenter:(UIButton *)button ssRollingButtonScrollView:(SSRollingButtonScrollView *)rollingButtonScrollView
	{
    	// Insert your code for action to take in the event an SSRollingButtonScrollView UIButton is
		// scrolled to the center of the visible view.
	}
	```

	You may also implement the following UIScrollViewDelegate methods which are available through the `<SSRollingButtonScrollViewDelegate>`. For information regarding the following methods, see the Apple Developer documentation.
	
	```objectivec
	- (void)scrollViewDidScroll:(UIScrollView *)scrollView
	- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
	- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
	- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
	- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
	- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
	- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
	```
