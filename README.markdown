CABarMenu
=========

A Tweetbot 3-like drop down menu (like the tweetbot list view by holding down the title)

[Tweetbot](/Comparison-Images/tweetbot.png) : [CABarMenu](/Comparison-Images/cabarmenu.jpg) : [Video Demo](https://www.youtube.com/watch?v=8k0t8uFug90)

CABarMenu's content supports any kind of subview class! In the example, I use a table view. Images, collection views, buttons, and text fields also
work with this.

Usage
=========

1. Simply import all files from the ```Classes``` folder in to your project.
2. In your desired view, import **CABarMenu.h**
3. Define a CABarMenu in your implementation. ```CABarMenu *menu;```
4. In *super viewDidLoad*, call  ```menu = [[CABarMenu alloc] init];```
5. Make a button or something that shows/hides the menu. To show the menu,
you can use: ```[menu showFromNavigationBar:navbarnamehere animated:YES];```
And to hide the menu, ```[menu hideAnimated:YES];```.
