//
//  ViewController.h
//  DemoProject_Vandan
//
//  Created by Vandan Govind Pawar on 19/09/16.
//  Copyright © 2016 Vandan's Creation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPageViewControllerDataSource>

@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (weak, nonatomic) IBOutlet UIButton *button_GetStarted;
@property (strong, nonatomic) NSArray *pageTitles;
@property (strong, nonatomic) NSArray *pageImages;
- (IBAction)actionOnGetStartedButton:(id)sender;
@end

