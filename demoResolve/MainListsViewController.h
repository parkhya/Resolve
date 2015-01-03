//
//  MainListsViewController.h
//  Resolved
//
//  Created by Abc on 30/12/14.
//  Copyright (c) 2014 Parkhya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainListsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
    
    
    NSMutableArray *Addsolve;
}

@property (weak, nonatomic) IBOutlet UITableView *MainListTableView;
@property (weak, nonatomic) IBOutlet UITableViewCell *MainListCell;
- (IBAction)EditBtnAct:(id)sender;
- (IBAction)RewardActBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *Datelab;
@end
