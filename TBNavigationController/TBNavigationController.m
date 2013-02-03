//
//  TBNavigationController.m
//
//  Created by Tyler Barth on 2013-01-28.
//

#import "TBNavigationController.h"
#import "UIBarButtonItem+UIBarButtonItem_CustomImage.h"
#import "UIViewController+UIViewController_customBackBarButtonItem.h"

@interface TBNavigationController ()


@end

@implementation TBNavigationController

- (void) pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    UIBarButtonItem *customBack = [self.topViewController customBackBarButtonItem];
    customBack.target = self;
    customBack.action = @selector(goBack);
        
    viewController.navigationItem.leftBarButtonItem = customBack;
    
    //This is optional, you can do other stuff here. 
    if (viewController == self.topViewController) {
        viewController.hidesBottomBarWhenPushed = NO;
    }
    else
        viewController.hidesBottomBarWhenPushed = YES;
    
    [super pushViewController:viewController animated:animated];
}

-(void) goBack
{
    [self popViewControllerAnimated:YES];
}

@end
