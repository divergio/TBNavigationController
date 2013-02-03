//
//  TBNavigationController.m
//
//  Created by Tyler Barth on 2013-01-28.
//

#import "TBNavigationController.h"
#import "UIBarButtonItem+UIBarButtonItem_CustomImage.h"
#import "UIViewController+CustomBackBarButtonItem.h"

@implementation TBNavigationController

- (void) pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //Get the custom back button from the pushing view controller
    UIBarButtonItem *customBack = [self.topViewController customBackBarButtonItem];
    customBack.target = self;
    customBack.action = @selector(goBack);
    
    //Set it as the left bar button item for the pushed view controller
    viewController.navigationItem.leftBarButtonItem = customBack;
    
    [super pushViewController:viewController animated:animated];
}

-(void) goBack
{
    [self popViewControllerAnimated:YES];
}

@end
