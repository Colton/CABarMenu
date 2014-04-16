//
//  ViewController.m
//  CABarMenu Demo
//
//  Created by Colton Anglin on 4/15/14.
//  Copyright (c) 2014 Colton Anglin. All rights reserved.
//

#import "ViewController.h"
#import "CABarMenu.h"

@interface ViewController ()

@end

@implementation ViewController {
    
    CABarMenu *menu;
    UINavigationBar *navbar;
    NSArray *tableData;
    UITableView *tableview;
    UITableViewCell *cell;
    UIView *bg;


}

- (void)viewDidLoad
{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self
               action:@selector(showBarMenu)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Show Menu" forState:UIControlStateNormal];
    button.frame = CGRectMake(20 ,60, 160.0, 40.0);
    button.backgroundColor = [UIColor clearColor];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"5"]]];
    navbar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, 320, 66)];
    [self.view addSubview:navbar];
    [super viewDidLoad];

    
    menu = [[CABarMenu alloc] init];
    menu.barTintColor = [UIColor colorWithRed:(30.0f/255.0f) green:(30.0f/255.0f) blue:(30.0f/255.0f) alpha:1.0];
    menu.backgroundColor = [UIColor colorWithRed:(30.0f/255.0f) green:(30.0f/255.0f) blue:(03.0f/255.0f) alpha:1.0];
    menu.alpha = 0.80f;
    menu.layer.cornerRadius = 15.0f;
    menu.clipsToBounds = YES;
    
    tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 60, 0, 416)];
    tableview.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    tableview.backgroundColor = [UIColor clearColor];
    tableview.dataSource = self;
    tableview.delegate = self;
    tableview.scrollIndicatorInsets = UIEdgeInsetsZero;
    tableview.contentInset = UIEdgeInsetsZero;
    [tableview setSeparatorInset:UIEdgeInsetsZero];
    tableview.backgroundColor = [UIColor clearColor];
    [menu addSubview:tableview];
    tableData = [NSArray arrayWithObjects:@"Jordan Earle", @"Marcel Voss", @"Jonathan Kingsley", @"Finn Gaida", @"A Random Goat", nil];

    bg.layer.zPosition = 0;
    menu.layer.zPosition = 1;
    navbar.layer.zPosition = 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
UIView *selectionColor = [[UIView alloc] init];
selectionColor.backgroundColor = [UIColor colorWithRed:(0/255.0) green:(122/255.0) blue:(225/255.0) alpha:1];
cell.selectedBackgroundView = selectionColor;
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    
    cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 48.5;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)showBarMenu {
    bg =[[UIView alloc]initWithFrame:CGRectMake(0, 0, 480, 960)];
    [bg setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:bg];
    bg.alpha = 0.0f;
    bg.userInteractionEnabled = NO;
  

    [UIView animateWithDuration:0.3 animations:^(void) {
        bg.alpha = 0.5f;
    }];
    
    [menu showFromNavigationBar:navbar animated:YES];
}

- (void) dealloc {
    tableview.delegate = nil;      // Really, really defensive
    tableview.dataSource = nil;    // here, but it won't hurt

}
@end
