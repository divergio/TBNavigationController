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
    
    NSArray *leftItemsArray = [NSArray arrayWithObjects:customBack,[UIBarButtonItem buttonSeparator],nil];
    
    viewController.navigationItem.leftBarButtonItems = leftItemsArray;
    
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
