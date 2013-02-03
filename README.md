##What is TBNavigationController

TBNavigationController is a custom navigation controller that allows completely custom `backBarButtonItem`s. It does this by not actually using the standard `backBarButtonItem,` which is limited by Apple to UIBarButtonItem's *without* custom views, but instead by faking it and using a `leftBarButtonItem`. 

##I need a custom back bar button, what should I do?

If you just want to change the title

##How did you make this?

If you need a `backBarButtonItem` that uses a custom view, you can fake it by 

##Instructions

1. Set the custom class of your navigation controller to `TBNavigationController`.
2. Change the default back button in `UIBarButtonItem+UIBarButtonItem_CustomImage` to whatever you want.
3. On those UIViewControllers that have custom back bar button items, import `UIViewController+UIViewController_CustomBackBarButtonItem.h` and possibly `UIBarButtonItem+UIBarButtonItem_CustomImage.h`.
4. Then set `self.customBackBarButtonItem = [UIBarButtonItem barItemWithImage:[UIImage imageNamed:@"someImage.png"] target:nil action:nil];`
5. You should now have custom back buttons for going back to that UIViewController.

##FAQ

###Why did you make this?

My client needed *very* custom back buttons that look nothing like Apple's. I didn't want to have to manually set back buttons for each page, and the only way I could think of to get the usual functionality of setting the back button on the parent view controller to change the button for the current controller was to subclass UINavigationController.

###What does it look like?

###Why upload it?

I thought I was kind of clever using my favorite new Objective-C feature, associated objects, so I thought I should let others take a look.

## Known limitations

This method loses the standard back button animations, which is kind of a deal breaker. I'm trying to fix that. Any help would be appreciated. 

##Feedback

I’m very open to feedback, especially bug reports. I’m using some language features I’m new to, so some veteran feedback would be much appreciated.

## Copyright and License

Copyright 2013 Tyler Barth

[MIT License](http://opensource.org/licenses/MIT "license")