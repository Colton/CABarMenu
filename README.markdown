CABarMenu
=========

A Tweetbot 3-like drop down menu made from the UIToolbar class (like the tweetbot list view by holding down the title)

[Tweetbot](http://192.241.189.143/hosting/tweet.gif) : [CABarMenu](http://192.241.189.143/hosting/demo.gif) : [Video Demo](https://www.youtube.com/watch?v=8k0t8uFug90)

CABarMenu's content supports any kind of subview class! In the example, I use a table view. Images, collection views, buttons, and text fields also
work fine.

Usage
=========

1. Simply import all files from the ```Classes``` folder in to your project.
2. In your desired view, import **CABarMenu.h**
3. Define a CABarMenu in your implementation. ```CABarMenu *menu;```
4. In *[super viewDidLoad]*, call  ```menu = [[CABarMenu alloc] init];```
5. Make a button or something that shows/hides the menu. To show the menu,
you can use: ```[menu showFromNavigationBar:navbarnamehere animated:YES];```
And to hide the menu, ```[menu hideAnimated:YES];```.


Customisation
==========

You can customise the appearance of the bar in CABarMenu.m by adjusting the defaults in the 'init' method.
    
 To add the table view like in the demo, you can use this snippet:

``` objective-c
UITableView *tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 40, 0, 416)];
    tableview.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    tableview.delegate = self;
    tableview.dataSource = self;
    tableview.backgroundColor = [UIColor clearColor];
    tableview.scrollIndicatorInsets = UIEdgeInsetsZero;
    tableview.contentInset = UIEdgeInsetsZero;
    [tableview setSeparatorInset:UIEdgeInsetsZero];
    [menu addSubview:tableview];
```

Since this is from the UIToolBar class, it responds to barTint, backgroundColor, and many other methods.


**Feel free to submit pull requests!**

*-Colton*
