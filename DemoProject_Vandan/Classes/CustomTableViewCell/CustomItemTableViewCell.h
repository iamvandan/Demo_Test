//
//  CustomItemTableViewCell.h
//  DemoProject_Vandan
//
//  Created by Vandan Govind Pawar on 20/09/16.
//  Copyright © 2016 Vandan's Creation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomItemTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *iamVandanCOn;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailInfoLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel_iPad;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel_iPad;
@property (weak, nonatomic) IBOutlet UILabel *detailInfoLabel_iPad;
@property (weak, nonatomic) IBOutlet UIImageView *titleImageView_iPhone;

@end
