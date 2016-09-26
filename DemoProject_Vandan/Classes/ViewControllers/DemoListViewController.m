//
//  DemoListViewController.m
//  DemoProject_Vandan
//
//  Created by Vandan Govind Pawar on 20/09/16.
//  Copyright © 2016 Vandan's Creation. All rights reserved.
//

#import "DemoListViewController.h"
#import "CustomItemTableViewCell.h"
#import "DemoCollectionViewController.h"

@interface DemoListViewController ()
{
    NSMutableDictionary *dataMutableDictionary;
}
@end

@implementation DemoListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupIntialSettings];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Custom methods

-(void)setupIntialSettings
{
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
    [self.itemsListTableViewController registerNib:[UINib nibWithNibName:@"CustomItemTableViewCell" bundle:nil] forCellReuseIdentifier:@"ReuseIdentifier"];
    else [self.itemListTableViewController_iPhone registerNib:[UINib nibWithNibName:@"CustomItemTableViewCell" bundle:nil] forCellReuseIdentifier:@"ReuseIdentifier"];
    [self enterDataInListMutableDictionary];
}

-(void)enterDataInListMutableDictionary
{
    NSArray *titleLabelArray = [[NSArray alloc]initWithObjects:@"Shedon Morphy",@"Massdrop",@"Product Hunt",@"Mighty Deals",nil];
    NSArray *detailInfoLabelArray = [[NSArray alloc]initWithObjects:@"Few days ago, Apple introduced iPhone 6 Plus. The new iPhone substantially changes the way graphics are rendered on screen. We've made an infographic to demystify this.",@"iPhone 6 Plus has screen with lower pixel resolution than the image rendered in previous step. iPhone 6 Plus has screen with lower pixel resolution than the image rendered in previous step. ",@"To demonstrate different rendering of pixels on various devices, we compare how 1-point wide line is rendered on!",@"The downscaling ratio is 1920 / 2208 = 1080 / 1242 = 20 / 23. That means every 23 pixels from the original render have to be mapped to 20 physical pixels. In other words the image is scaled down to approximately 87% of its original size.",nil];
    NSArray *subTitleInfoLabelArray = [[NSArray alloc]initWithObjects:@"This is dummy text.",@"This is dummy text. This is dummy text.",@"This is dummy text.",@"This is dummy text.",nil];
    dataMutableDictionary = [[NSMutableDictionary alloc]initWithObjects:[NSArray arrayWithObjects:titleLabelArray,subTitleInfoLabelArray,detailInfoLabelArray,nil] forKeys:[NSArray arrayWithObjects:@"TitleArray",@"SubTitleArray",@"DetailInfoArray",nil]];
}

#pragma mark - Tableview delegates

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
        return 199.0f;
    return 130.0f;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reusableString = @"ReuseIdentifier";
    CustomItemTableViewCell *customTableViewCellInstance = [tableView dequeueReusableCellWithIdentifier:reusableString forIndexPath:indexPath];
    if (customTableViewCellInstance == nil)
        customTableViewCellInstance = [[CustomItemTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reusableString];
    
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
    {
        customTableViewCellInstance.titleLabel_iPad.text = [[dataMutableDictionary objectForKey:@"TitleArray"] objectAtIndex:indexPath.row];
        customTableViewCellInstance.subTitleLabel_iPad.text = [[dataMutableDictionary objectForKey:@"SubTitleArray"] objectAtIndex:indexPath.row];
        customTableViewCellInstance.detailInfoLabel_iPad.text = [[dataMutableDictionary objectForKey:@"DetailInfoArray"] objectAtIndex:indexPath.row];
    }
    else
    {
        customTableViewCellInstance.titleLabel.text = [[dataMutableDictionary objectForKey:@"TitleArray"] objectAtIndex:indexPath.row];
        customTableViewCellInstance.subTitleLabel.text = [[dataMutableDictionary objectForKey:@"SubTitleArray"] objectAtIndex:indexPath.row];
        customTableViewCellInstance.detailInfoLabel.text = [[dataMutableDictionary objectForKey:@"DetailInfoArray"] objectAtIndex:indexPath.row];
    }
    return customTableViewCellInstance;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DemoCollectionViewController *demoCollectionViewControllerInstance = [self.storyboard instantiateViewControllerWithIdentifier:@"demoCollectionViewControllerStoryboardID"];
    [self.navigationController pushViewController:demoCollectionViewControllerInstance animated:NO];
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
