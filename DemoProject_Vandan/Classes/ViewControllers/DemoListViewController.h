//
//  DemoListViewController.h
//  DemoProject_Vandan
//
//  Created by Vandan Govind Pawar on 20/09/16.
//  Copyright © 2016 Vandan's Creation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DemoListViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *titleView;
@property (weak, nonatomic) IBOutlet UITableView *itemsListTableViewController;
@property (weak, nonatomic) IBOutlet UITableView *itemListTableViewController_iPhone;

@end
