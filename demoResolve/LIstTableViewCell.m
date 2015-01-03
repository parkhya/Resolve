//
//  LIstTableViewCell.m
//  Resolved
//
//  Created by Abc on 30/12/14.
//  Copyright (c) 2014 Parkhya. All rights reserved.
//

#import "LIstTableViewCell.h"

@implementation LIstTableViewCell
@synthesize CellLab,RightImg,OneWeekLab,ResolveNameLab,RightBtn,NameLabel;
@synthesize Mon,Tue,Thu,Fri,Sat,Sun,Wed,DayWeeKView;
@synthesize RewardNameLab,RewradCostLab;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (IBAction)ChangeStar:(id)sender {
}
@end
