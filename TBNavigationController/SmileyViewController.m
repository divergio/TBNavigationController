//
//  SmileyViewController.m
//  TBNavigationController
//
//  Created by Tyler Barth on 2013-02-03.
//  Copyright (c) 2013年 Tyler Barth. All rights reserved.
//

#import "SmileyViewController.h"
#import "UIViewController+UIViewController_CustomBackBarButtonItem.h"
#import "UIBarButtonItem+UIBarButtonItem_CustomImage.h"

@interface SmileyViewController ()

@end

@implementation SmileyViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Inside a TBNavigationController, this back button will be used.
    self.customBackBarButtonItem = [UIBarButtonItem barItemWithImage:[UIImage imageNamed:@"custom_back_smiley.png"] target:nil action:nil];
    
    //Inside a normal UINavigationController, this back button will be used.
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"custom_back_smiley.png"] style:UIBarButtonItemStylePlain target:nil action:nil];
    
}

@end
