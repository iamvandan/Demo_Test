//
//  PageContentViewController.m
//  DemoProject_Vandan
//
//  Created by Vandan Govind Pawar on 19/09/16.
//  Copyright © 2016 Vandan's Creation. All rights reserved.
//

#import "PageContentViewController.h"

@interface PageContentViewController ()

@end

@implementation PageContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pageContentImageTitle.text = self.titleText;
    [_label_intro1 sizeToFit];
    switch (_pageIndex)
    {
        case 0:
            _pageContentViewSubLayer.backgroundColor = [UIColor redColor];
        break;
            
        case 1:
            _pageContentViewSubLayer.backgroundColor = [UIColor yellowColor];
            break;
            
        case 2:
            _pageContentViewSubLayer.backgroundColor = [UIColor blueColor];
            break;
            
        case 3:
            _pageContentViewSubLayer.backgroundColor = [UIColor greenColor];
            break;
            
        default:
            break;
    }
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
