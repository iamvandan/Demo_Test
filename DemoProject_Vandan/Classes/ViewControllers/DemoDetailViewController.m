//
//  DemoDetailViewController.m
//  DemoProject_Vandan
//
//  Created by Vandan Govind Pawar on 21/09/16.
//  Copyright © 2016 Vandan's Creation. All rights reserved.
//

#import "DemoDetailViewController.h"
#import "DemoDetailsTableViewCell.h"
#import "DemoDetailsSecondTableViewCell.h"

@interface DemoDetailViewController ()

@end

@implementation DemoDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupIntialSettings];
    //DetailReusableIdentifier
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupIntialSettings
{
    if ( UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPad )
    {
        [self.demoDetailTableViewController_iPhone registerNib:[UINib nibWithNibName:@"DemoDetailsTableViewCell" bundle:nil] forCellReuseIdentifier:@"DetailReusableIdentifier"];
        [self.demoDetailTableViewController_iPhone registerNib:[UINib nibWithNibName:@"DemoDetailsSecondTableViewCell" bundle:nil] forCellReuseIdentifier:@"DetailSecReuseIdentifier"];
    }
    else
    {
        [self.demoDetailTableViewController_iPad registerNib:[UINib nibWithNibName:@"DemoDetailsTableViewCell" bundle:nil] forCellReuseIdentifier:@"DetailReusableIdentifier"];
        [self.demoDetailTableViewController_iPad registerNib:[UINib nibWithNibName:@"DemoDetailsSecondTableViewCell" bundle:nil] forCellReuseIdentifier:@"DetailSecReuseIdentifier"];

        //DetailSecReuseIdentifier
    }
}


#pragma mark - Tableview delegates

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
        if(indexPath.row == 0)
        {
            return 360.0;
        }
       else
        {
            return 190.0f;
         }
    else
    {
        if(indexPath.row == 0)
            return 260.0f;
        else
            return 160.0f;
    }
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reusableString = @"DetailReusableIdentifier";
    static NSString *reusableStringSec = @"DetailSecReuseIdentifier";

    if (indexPath.row == 0)
    {
        DemoDetailsTableViewCell *customTableViewCellInstance = [tableView dequeueReusableCellWithIdentifier:reusableString forIndexPath:indexPath];
        if (customTableViewCellInstance == nil)
            customTableViewCellInstance = [[DemoDetailsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reusableString];
        return customTableViewCellInstance;
    }
    else
    {
        DemoDetailsSecondTableViewCell *customTableViewCellInstance = [tableView dequeueReusableCellWithIdentifier:reusableStringSec forIndexPath:indexPath];
        if (customTableViewCellInstance == nil)
            customTableViewCellInstance = [[DemoDetailsSecondTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reusableStringSec];
        return customTableViewCellInstance;
    }
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
