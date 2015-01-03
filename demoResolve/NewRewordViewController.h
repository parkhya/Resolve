//
//  NewRewordViewController.h
//  Resolved
//
//  Created by Abc on 31/12/14.
//  Copyright (c) 2014 Parkhya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewRewordViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,   UIPickerViewDataSource,UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *RewardName;
@property (weak, nonatomic) IBOutlet UITextField *RewardPoint;
- (IBAction)SaveReward:(id)sender;
- (IBAction)CancelReward:(id)sender;


@end
