//
//  ViewController.h
//  CABarMenu Demo
//
//  Created by Colton Anglin on 4/15/14.
//  Copyright (c) 2014 Colton Anglin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, assign) id<UITableViewDelegate> delegate;
@property(nonatomic, assign) id<UITableViewDataSource> dataSource;

@end
