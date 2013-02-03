//
//  TBNavigationController.h
//
//  Created by Tyler Barth on 2013-01-28.
//
//
// Unfortunately, the normal UINavigationController doesn't support overriding the
// backBarButtonItem with a UIBarButtonItem that uses a custom view, which is what we need.
//
// The cleanest way to implement the same functionality is to add a leftBarButtonItem, but to
// have it work the same way as UINavigationController (i.e. the parent sets it's backBarButtonItem),
// We've implemented a custom UINavigationController.
//
// This can also allow for custom animations. 
//

#import <UIKit/UIKit.h>

@interface TBNavigationController : UINavigationController

@end
