SSRollingButtonScrollView
=========================

SSRollingButtonScrollView is a custom UIScrollView subclass that features an infinite looping scroll of UIButtons. Users of SSRollingButtonScrollView must, at minimum, provide an array of button titles and specify a layout style (horizontal scrolling or vertical scrolling). Through the implementation of the optional delegate methods, the user is informed of any button being pushed (touchUpInside), any button being scrolled to the center of the view, and most of the UIScrollViewDelegate methods (some are not available as they interfere with the working of the SSRollingButtonScrollView). The inifinite scrolling code is based on Apple's InfiniteScrollView class found in the StreetScroller sample project.


How To Use
----------

1. Add the **SSRollingButtonScrollView.h** and **SSRollingButtonScrollView.m** files to your project.

2. Add the **AudioToolbox.framework** to your project.

3. Add the appropriate **#import** and **@class** statements to the view controller(s) that will be using an SSRollingButtonScrollView.
      
      ```objectivec
      {
        //
        // ViewController.h
        //
        
        #import <UIKit/UIKit.h>

        @class SSRollingButtonScrollView;

        @interface ViewController : UIViewController
        
        @end
      }
      ```
      ```objectivec
      {
        //
        // ViewController.m
        //
        
        #import "ViewController.h"
        #import "SSRollingButtonScrollView.h"

        @interface ViewController ()

        @end
        
        ...
        ...
      }
      ```
      
4. Make your view controller an **SSRollingButtonScrollView** delegate.

      ```objectivec
      {
        //
        // ViewController.m
        //
        
        ...
        ...
        
        @interface ViewController () <SSRollingButtonScrollViewDelegate>
        
        ...
        ...
      }

