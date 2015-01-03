//
//  LIstTableViewCell.h
//  Resolved
//
//  Created by Abc on 30/12/14.
//  Copyright (c) 2014 Parkhya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LIstTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *CellLab;
@property (weak, nonatomic) IBOutlet UILabel *PoinValueLab;
@property (weak, nonatomic) IBOutlet UIView *DayWeeKView;
@property (weak, nonatomic) IBOutlet UIButton *Mon;
@property (weak, nonatomic) IBOutlet UIButton *Tue;
@property (weak, nonatomic) IBOutlet UIButton *Wed;
@property (weak, nonatomic) IBOutlet UIButton *Thu;
@property (weak, nonatomic) IBOutlet UIButton *Fri;
@property (weak, nonatomic) IBOutlet UIButton *Sun;
@property (weak, nonatomic) IBOutlet UIButton *Sat;

@property (weak, nonatomic) IBOutlet UILabel *NameLabel;
@property (weak, nonatomic) IBOutlet UILabel *RewradCostLab;
@property (weak, nonatomic) IBOutlet UIImageView *RightImg;
@property (weak, nonatomic) IBOutlet UILabel *OneWeekLab;
@property (weak, nonatomic) IBOutlet UILabel *ResolveNameLab;
@property (weak, nonatomic) IBOutlet UILabel *MoviesNameLab;
@property (weak, nonatomic) IBOutlet UILabel *RewardNameLab;
@property (weak, nonatomic) IBOutlet UIImageView *StarImg;
@property (weak, nonatomic) IBOutlet UILabel *PoinLab;
- (IBAction)ChangeStar:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *poin2;
@property (weak, nonatomic) IBOutlet UILabel *JenseLab;
@property (weak, nonatomic) IBOutlet UIButton *ChangeStar;
@property (weak, nonatomic) IBOutlet UIButton *RightBtn;
- (IBAction)RightBtnAct:(id)sender;
@end
