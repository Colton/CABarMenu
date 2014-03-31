CABarMenu
=========

A Tweetbot 3-like drop down menu made from the UINavigationBar class (like the tweetbot list view by holding down the title)

[Tweetbot](/Comparison-Images/tweetbot.png) : [CABarMenu](/Comparison-Images/cabarmenu.jpg) : [Video Demo](https://www.youtube.com/watch?v=8k0t8uFug90)

CABarMenu's content supports any kind of subview class! In the example, I use a table view. Images, collection views, buttons, and text fields also
work fine.

Usage
=========

1. Simply import all files from the ```Classes``` folder in to your project.
2. In your desired view, import **CABarMenu.h**
3. Define a CABarMenu in your implementation. ```CABarMenu *menu;```
4. In *super viewDidLoad*, call  ```menu = [[CABarMenu alloc] init];```
5. Make a button or something that shows/hides the menu. To show the menu,
you can use: ```[menu showFromNavigationBar:navbarnamehere animated:YES];```
And to hide the menu, ```[menu hideAnimated:YES];```.

Customisation
==========

You can use this snippet below to get the Tweetbot style of menu
shown in the demo (just place it in your desired view):

``` objective-c
    menu.barTintColor = [UIColor colorWithRed:(30.0f/255.0f) green:(30.0f/255.0f) blue:(30.0f/255.0f) alpha:1.0];
    menu.backgroundColor = [UIColor colorWithRed:(30.0f/255.0f) green:(30.0f/255.0f) blue:(03.0f/255.0f) alpha:1.0];
    menu.alpha = 0.85f;
    menu.layer.cornerRadius = 15.0f;
    menu.clipsToBounds = YES;
    ```

To add the table view like in the demo, you can use:

``` objective-c
UITableView *tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 40, 0, 416)];
    tableview.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    tableview.delegate = self;
    tableview.dataSource = self;
    tableview.backgroundColor = [UIColor clearColor];
    tableview.scrollIndicatorInsets = UIEdgeInsetsZero;
    tableview.contentInset = UIEdgeInsetsZero;
    [tableview setSeparatorInset:UIEdgeInsetsZero];
    [menu addSubview:tableview];```

Below are all of the customisation types you can use:

``` objective-c
barTint
backgroundColor
alpha
setTranslucent:
cornerRadius - You must use 'menu.layer.cornerRadius' instead of 'menu.cornerRadius'
```
With those above, you should be able to customise it
to your liking.

**Feel free to submit pull requests!**
