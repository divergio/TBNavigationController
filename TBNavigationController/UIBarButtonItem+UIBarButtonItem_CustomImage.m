//
//  UIBarButtonItem+UIBarButtonItem_CustomImage.m
//
//  Created by Tyler Barth on 2013-01-25.
//

#import "UIBarButtonItem+UIBarButtonItem_CustomImage.h"

@implementation UIBarButtonItem (UIBarButtonItem_CustomImage)


+ (UIBarButtonItem*)barItemWithImage:(UIImage*)image target:(id)target action:(SEL)action
{
    UIButton *imgButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [imgButton setImage:image forState:UIControlStateNormal];
    imgButton.frame = CGRectMake(0.0, 0.0, image.size.width, image.size.height);

    UIBarButtonItem *b = [[UIBarButtonItem alloc]initWithCustomView:imgButton];
    
    [imgButton addTarget:b action:@selector(performBarButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [b setAction:action];
    [b setTarget:target];
    
    return b;
}

+ (UIBarButtonItem*) defaultBackButton
{
    return [UIBarButtonItem barItemWithImage:[UIImage imageNamed:@"custom_back_button.png"] target:nil action:nil];
}

-(void)performBarButtonAction:(UIButton*)sender
{
    [[self target] performSelector:self.action withObject:self];
}


@end
