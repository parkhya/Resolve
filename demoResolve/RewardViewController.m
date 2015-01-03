//
//  RewardViewController.m
//  Resolved
//
//  Created by Abc on 31/12/14.
//  Copyright (c) 2014 Parkhya. All rights reserved.
//

#import "RewardViewController.h"
#import "LIstTableViewCell.h"

@interface RewardViewController ()
{
NSMutableArray *Addrewards;
}
@end

@implementation RewardViewController
@synthesize RewardTableView;

- (void)viewDidLoad {
    [super viewDidLoad];
     Addrewards = [[NSMutableArray alloc] init];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [Addrewards count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *simpleTableIdentifier = @"RewardList";
    LIstTableViewCell *cell = (LIstTableViewCell*)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[LIstTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        
    }
    NSDictionary *dic = [Addrewards objectAtIndex:indexPath.section];
    cell.RewardNameLab.text = [dic objectForKey:@"rewardname"];
    cell.RewradCostLab.text = [dic objectForKey:@"RewardPoint"];

    return cell;

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
}


-(void)viewWillDisappear:(BOOL)animated{
    
    
}
-(void)viewWillAppear:(BOOL)animated{
    
    if ([[NSUserDefaults standardUserDefaults]objectForKey:@"New Reward"]) {
        Addrewards=[[NSUserDefaults standardUserDefaults]objectForKey:@"New Reward"];
    }else {}
    
    [RewardTableView reloadData];
    
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Remove seperator inset
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    // Prevent the cell from inheriting the Table View's margin settings
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    
    // Explictly set your cell's layout margins
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
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

- (IBAction)AddNewReward:(id)sender {
     [self performSegueWithIdentifier:@"AddReward" sender:self];
}

- (IBAction)BackBtn:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
