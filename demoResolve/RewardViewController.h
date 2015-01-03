//
//  RewardViewController.h
//  Resolved
//
//  Created by Abc on 31/12/14.
//  Copyright (c) 2014 Parkhya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RewardViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITableView *RewardTableView;
@property (weak, nonatomic) IBOutlet UIButton *AddRewardBtn;
- (IBAction)AddNewReward:(id)sender;
- (IBAction)BackBtn:(id)sender;

@end
