//
//  PageContentViewController.h
//  DemoProject_Vandan
//
//  Created by Vandan Govind Pawar on 19/09/16.
//  Copyright © 2016 Vandan's Creation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageContentViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *pageContentImageTitle;
@property NSUInteger pageIndex;
@property NSString *titleText;
@property (weak, nonatomic) IBOutlet UIView *pageContentViewSubLayer;
@property (weak, nonatomic) IBOutlet UILabel *label_intro1;

@end
