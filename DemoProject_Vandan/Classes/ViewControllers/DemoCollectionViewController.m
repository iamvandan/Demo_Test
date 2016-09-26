//
//  DemoCollectionViewController.m
//  DemoProject_Vandan
//
//  Created by Vandan Govind Pawar on 20/09/16.
//  Copyright © 2016 Vandan's Creation. All rights reserved.
//

#import "DemoCollectionViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "RBCollectionViewBalancedColumnLayout.h"
#import "DemoDetailViewController.h"

#define device_Height  [UIScreen mainScreen].bounds.size.height
#define iPhone6_CollectionViewCell_Width 180
#define iPhone6Plus_CollectionViewCell_Width 200
#define iPhone5_CollectionViewCell_Width 150

@interface DemoCollectionViewController ()< RBCollectionViewBalancedColumnLayoutDelegate >

@property (nonatomic, strong) NSMutableDictionary *imageDataDictionary ;
@property (nonatomic, strong) NSCache * imageCache;

@end

@implementation DemoCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:NO];
    [self setupIntialSettings];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Custom methods

-(void)setupData
{
    NSArray *imageNameArray = [[NSArray alloc]initWithObjects:@"image_1",@"image_2",@"image_3",@"image_4",@"image_5",@"image_6",nil];
    NSArray *imageTitleArray = [[NSArray alloc]initWithObjects:@"#image_demo-1",@"image_demo_2",@"image_demo_3",@"image_demo_4",@"image_demo_5",@"image_demo_6",nil];
    NSArray *imageHeightArray = [[NSArray alloc]initWithObjects:@"300",@"200",@"230",@"300",@"290",@"230",nil];
    self.imageDataDictionary = [[NSMutableDictionary alloc]initWithObjects:[NSArray arrayWithObjects:imageNameArray,imageTitleArray, imageHeightArray,nil] forKeys:[NSArray arrayWithObjects:@"ImageNameArray",@"ImageTitleArray",@"ImageHeightArray",nil]];
}

-(void)setupIntialSettings
{
    [self initCollectionViewData];
}

-(void)initCollectionViewData
{
    self.imageCache = [[NSCache alloc] init];
    RBCollectionViewBalancedColumnLayout * layout = (id)self.itemsCollectionViewController.collectionViewLayout;
    layout.interItemSpacingY = 10;
    layout.stickyHeader = YES;
    [self setupData];
    [_itemsCollectionViewController reloadData];
}

#pragma mark - Collection view delegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    return [[self.imageDataDictionary objectForKey:@"ImageNameArray"]count];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ResuseIdentifier" forIndexPath:indexPath];
    [self.view addSubview:cell];
    
    if ([self.imageCache objectForKey:[[self.imageDataDictionary objectForKey:@"ImageNameArray"] objectAtIndex:indexPath.row]] == nil)
    {
        UIImageView * imageView = (id)[cell viewWithTag:1];
        [imageView setImage:[UIImage imageNamed: [[self.imageDataDictionary objectForKey:@"ImageNameArray"] objectAtIndex:indexPath.row]]];//
        [self.imageCache setObject:[[self.imageDataDictionary objectForKey:@"ImageNameArray"] objectAtIndex:indexPath.row] forKey:[[self.imageDataDictionary objectForKey:@"ImageNameArray"] objectAtIndex:indexPath.row]];
    }
    else
    {
        UIImageView * imageView = (id)[cell viewWithTag:1];
        NSString *imageName = [self.imageCache objectForKey:[[self.imageDataDictionary objectForKey:@"ImageNameArray"] objectAtIndex:indexPath.row]];
        UIImage *image = [UIImage imageNamed:imageName];
        [imageView setImage:image];//
    }
   
    UILabel * label = (id)[cell viewWithTag:2];
    label.text = [[self.imageDataDictionary objectForKey:@"ImageTitleArray"] objectAtIndex:indexPath.row];
    UIView * footerView = (id)[cell viewWithTag:3];
    footerView.backgroundColor = [UIColor whiteColor];

    cell.layer.masksToBounds = NO;
    cell.layer.shadowOpacity = 0.4f;
    cell.layer.shadowRadius = 2.0f;
    cell.layer.shadowOffset = CGSizeMake(0, 1);
    cell.layer.shadowPath = [UIBezierPath bezierPathWithRect:cell.bounds].CGPath;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    DemoDetailViewController *demoDetailViewControllerInstance = [self.storyboard instantiateViewControllerWithIdentifier:@"demoDetailViewControllerStoryboardID"];
    [self.navigationController pushViewController:demoDetailViewControllerInstance animated:NO];
}

#pragma mark - RBCollectionViewBalancedColumnLayoutDelegate

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(RBCollectionViewBalancedColumnLayout*)collectionViewLayout heightForHeaderInSection:(NSInteger)section
{
    return 0.0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(RBCollectionViewBalancedColumnLayout*)collectionViewLayout heightForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSInteger height = [[[self.imageDataDictionary objectForKey:@"ImageHeightArray"] objectAtIndex:indexPath.row] integerValue];
    return height;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(RBCollectionViewBalancedColumnLayout*)collectionViewLayout heightForFooterInSection:(NSInteger)section
{
    return 0.0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(RBCollectionViewBalancedColumnLayout *)collectionViewLayout widthForCellsInSection:(NSInteger)section
{
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
        return 370.0f;
    else
       if (device_Height == 736)
          return iPhone6Plus_CollectionViewCell_Width;
       else if(device_Height == 667)
           return iPhone6_CollectionViewCell_Width;
    
    return iPhone5_CollectionViewCell_Width;
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
