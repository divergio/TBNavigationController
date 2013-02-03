##What is TBNavigationController

TBNavigationController is a custom navigation controller that allows completely custom backBarButtonItems. It does this by not actually using the standard `backBarButtonItem`, which is limited by Apple to UIBarButtonItem's *without* custom views, but instead by faking it and using a `leftBarButtonItem`. 

##I need a custom back bar button, what should I do?

If you just want to change the title, you can do this easily using the built in Interface Builder Navigation Item "Back Button" property, or by setting a custom back button in the `UIViewController`'s viewDidLoad.

If you want the standard style back button, but want an image inside the button, you can use the standard `self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"yourImage"] ...` method in your `UIViewController`.

If you want the same shape as Apple's back button, but just want a different background color, you can follow [this tutorial](http://www.raywenderlich.com/4344/user-interface-customization-in-ios-5 "Ray Wenderlich, UI customization in iOS 5").

If you don't want the same shape as Apple's back button, but still want basically the same type of back button (i.e. a standard image with some text overlaid over it), you can follow that tutorial and just use a custom resizable image. 

If you want a completely custom view for your back button, and are willing to manually set the back button for every child view controller, you can just create a `UIBarButtonItem` with `[UIBarButtonItem initWithCustomView:(UIView *)]`, set an action and target so that it calls a method which calls `popViewControllerAnimated:`, and set it as a your view controller's `navigationItem.leftBarButtonItem`.  

If you want a completely custom view for your back button, but only want to have to set the back button for the pushing view controller and have it affect the pushed controllers in an elegant way, the same as how Apple's built-in `backBarButtonItem` works, you should take a look at `TBNavigationController.`

##How does it work?

If you need a `backBarButtonItem` that uses a custom view, normally you are out of luck. Despite the `navigationItem.backBarButtonItem` property being classed as a `UIBarButtonItem*`, Apple, in an apparent breach of abstraction, will ignore UIBarButtonItems with custom views. Your only hint to this is a little note tagged onto the discussion section of the `backBarButtonItem` in the `UINavigationItem` class reference, which states: 

"When configuring your bar button item, do not assign a custom view to it; the navigation item ignores custom views in the back bar button anyway."

This has clearly tripped up a lot of people, as can be seen with the numerous stack overflow questions about their custom back bar button items being ignored. Anyway, it's Apple's API, so I'm sure they have their reasons.

The most obvious way around this restriction is to just make a fake back button: Make a `UIBarButtonItem` with a custom view, set up its target and action to pop the current view controller, and set it as the `leftBarButtonItem` of the pushed view controllers you want to change.

This gives you the greatest flexibility in terms of appearance and functionality of the back button, but it has a huge downside: You have to set the back button for each child view controller manually. 

To get around this, I subclassed `UINavigationController` and moved the code that sets the `leftBarButtonItem` into the `NavigationController` `- (void) pushViewController:(UIViewController *)viewController animated:(BOOL)animated` method. 

Now, whenever a view is pushed, the view controller looks for a custom back bar button and sets it as the `leftBarButtonItem` of the `viewController` to be pushed.

But this is only one part of the system, because we also need some way to associate a custom `backBarButtonItem` with every `UIViewController` instance, the way Apple already has a `backBarButtonItem` property for every `UIViewController` instance. We could subclass `UIViewController`, but that wouldn't affect existing subclasses of `UIViewController`. 

Instead, I added a category on `UIViewController` called `CustomBackBarButtonItem.` It does only one thing: it adds a property on UIViewController called `UIBarButtonItem* customBackBarButtonItem`.  

With this property, the new custom UINavigationController can look at the pushing view controller's `customBackBarButtonItem` and set it as the pushed view controller's `leftBarButtonItem`, replicating the functionality of the normal UINavigationController.

Categories can't actually have instance variables, though, so I used associated objects in the `CustomBackBarButtonItem` category. I also set it so that it will return a default custom back button if that view has no associated objects. This makes it so that any view which has not set a custom back button can still use a custom default back button that you set for the whole app. 

As a convenience, I also have a category on `UIBarButtonItem` to return the defaultBackButton and to help create UIBarButtonItems that use a `UIImageView` as a custom view as per [this stack overflow response](http://stackoverflow.com/a/13626345/1016515 "A category on UIBarButtonItem"). 

##Instructions

1. Set the custom class of your navigation controller to `TBNavigationController`.
2. Change the default back button in `UIBarButtonItem+UIBarButtonItem_CustomImage` to whatever you want.
3. On those UIViewControllers that have custom back bar button items, import `UIViewController+UIViewController+CustomBackBarButtonItem.h` and possibly `UIBarButtonItem+UIBarButtonItem_CustomImage.h`.
4. Then set `self.customBackBarButtonItem` to [UIBarButtonItem barItemWithImage:[UIImage imageNamed:@"someImage.png"] target:nil action:nil];`
5. You should now have custom back buttons for view controllers that go back to that UIViewController.

##FAQ

###Why did you make this?

My client needed *very* custom back buttons that look nothing like Apple's. I didn't want to have to manually set back buttons for each page, and subclassing UINavigationController to add my own custom back bar button functionality seemed like the most elegant solution.

###Why upload it?

I thought I was kind of clever using my favorite new Objective-C feature, associated objects, so I thought I should let others take a look. 

###What does it look like?

SmileyViewController
![smiley view controller](https://raw.github.com/divergio/TBNavigationController/master/screenshot_smiley.png)

UIViewController pushed from SmileyViewController
![smiley view controller pushed](https://raw.github.com/divergio/TBNavigationController/master/screenshot_pushedfromsmiley.png)

###Any other nagging concerns?

There might still be a way to achieve the same effects without subclassing `UINavigationController`. I was experimenting with using transparent resizable images and the `UIAppearance` protocol, then setting the normal `backBarButtonItem` property with a `UIBarButtonItem` initialized with an image. I was able to get something closer to what `TBNavigationController` does, but the image was still resized and smaller, and required one to manually set the image for other button states (i.e. no automatic tint). This approach did have the advantage of the standard swipe animation, though. 

## Known limitations

This method loses the standard back button swiping animation, which is kind of a deal breaker for most people. 

I'm currently not very familiar with animations, but I think it should be possible to animate the button in the same way as the normal back button. Any help would be appreciated. 

##Feedback

I’m very open to feedback, especially bug reports. I’m using some language features I’m new to, so some veteran feedback would be much appreciated.

## Copyright and License

Copyright 2013 Tyler Barth

[MIT License](http://opensource.org/licenses/MIT "license")