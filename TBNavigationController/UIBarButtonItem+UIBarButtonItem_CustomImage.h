//
//  UIBarButtonItem+UIBarButtonItem_CustomImage.h
//
//  Created by Tyler Barth on 2013-01-25.
//
//
// Trying this http://stackoverflow.com/a/13626345/1016515

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (UIBarButtonItem_CustomImage)
+ (UIBarButtonItem*)barItemWithImage:(UIImage*)image target:(id)target action:(SEL)action;

+ (UIBarButtonItem*) defaultBackButton;

-(void)performBarButtonAction:(id)sender;

@end
