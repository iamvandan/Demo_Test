//
//  DemoCollectionViewController.h
//  DemoProject_Vandan
//
//  Created by Vandan Govind Pawar on 20/09/16.
//  Copyright © 2016 Vandan's Creation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DemoCollectionViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *itemsCollectionViewController;

@end
