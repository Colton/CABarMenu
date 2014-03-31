

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "CABarMenu.h"
#import <QuartzCore/QuartzCore.h>



@interface MasterViewController () {
    NSMutableArray *_objects;
    UIView *darkbg;
    NSArray *tableData;
    
}
@end

@implementation MasterViewController {
  	CABarMenu *menu;
}

- (void)viewDidLoad
{
    
    //Get Screen Size for the bg image
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    //Set the array for the table view
    tableData = [NSArray arrayWithObjects:@"List 1",@"List 2",@"List 3",@"List 4", nil];
    
    //Set background to Tweetbot for the example
    UIImage *background = [UIImage imageNamed: @"b"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage: background];
    imageView.frame = CGRectMake(0, -66,screenWidth,screenHeight);
    [self.view addSubview: imageView];
    
    [super viewDidLoad];
    
    
  	self.navigationItem.leftBarButtonItem = self.editButtonItem;
    self.navigationController.navigationBar.translucent = NO;
    
    
  	menu = [[CABarMenu alloc] init];
  	menu.scrollView = self.tableView;
    menu.barTintColor = [UIColor colorWithRed:(30.0f/255.0f) green:(30.0f/255.0f) blue:(30.0f/255.0f) alpha:1.0];
    menu.backgroundColor = [UIColor colorWithRed:(30.0f/255.0f) green:(30.0f/255.0f) blue:(03.0f/255.0f) alpha:1.0];
    menu.alpha = 0.85f;
    
    menu.layer.cornerRadius = 15.0f;
    menu.clipsToBounds = YES;
    
    //Call the table view inside the BarMenu
    UITableView *tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 40, 000, 416)];
    tableview.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    tableview.delegate = self;
    tableview.dataSource = self;
    tableview.backgroundColor = [UIColor clearColor];
    tableview.scrollIndicatorInsets = UIEdgeInsetsZero;
    tableview.contentInset = UIEdgeInsetsZero;
    [tableview setSeparatorInset:UIEdgeInsetsZero];
    [menu addSubview:tableview];
    self.editButtonItem.title = @"Show";
    
    
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
  	[super setEditing:editing animated:animated];
    
  	if (editing) {
        self.editButtonItem.title = @"Hide";
        //Show Menu
  		[menu showFromNavigationBar:self.navigationController.navigationBar animated:YES];
  	} else {
        self.editButtonItem.title = @"Show";
        //Hide Menu
  		[menu hideAnimated:YES];
  	}
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        
        
    }
    
    
    
    
    cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.textColor = [UIColor whiteColor];
    UIImageView *bgView = [[UIImageView alloc]initWithFrame:cell.frame];
    bgView.backgroundColor = [UIColor colorWithRed:(28.0f/255.0f) green:(129.0f/255.0f) blue:(255.0f/255.0f) alpha:1.0];
    cell.selectedBackgroundView = bgView;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Do smth here. segue ..etc
    
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
}




- (void)action:(id)sender {
  	NSLog(@"Button pressed.");
}



@end
