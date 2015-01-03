//
//  NewResolutionViewController.h
//  Resolved
//
//  Created by Abc on 30/12/14.
//  Copyright (c) 2014 Parkhya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewResolutionViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *ResolveLab;
@property (weak, nonatomic) IBOutlet UITableView *OFTENListTableView;
- (IBAction)NewReslvedSaveBTn:(id)sender;
@property (nonatomic, retain) NSIndexPath* checkedIndexPath;
@property (weak, nonatomic) IBOutlet UITableViewCell *simpalcell;
@property (weak, nonatomic) IBOutlet UILabel *DayLab;

@property (weak, nonatomic) IBOutlet UILabel *TimePerLab;
@property (weak, nonatomic) IBOutlet UITextField *Point;
@property (weak, nonatomic) IBOutlet UITableView *WeektableView;


- (IBAction)CancelBtb:(id)sender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *Segment;
- (IBAction)ChangeSegment:(id)sender;

@end
