//
//  MainListsViewController.m
//  Resolved
//
//  Created by Abc on 30/12/14.
//  Copyright (c) 2014 Parkhya. All rights reserved.
//

#import "MainListsViewController.h"
#import "LIstTableViewCell.h"
#import "NewResolutionViewController.h"



@interface MainListsViewController ()
{
    
    NSString *dateString2Prev;
    NSDate *weekstartPrev;
    NSString *dateEndPrev;
    NSDate *weekEndPrev;
    NSDateFormatter *dateFormat;
    int ofset;

}
@end

@implementation MainListsViewController
@synthesize MainListTableView,Datelab;

- (void)viewDidLoad {
    [super viewDidLoad];
   Addsolve = [[NSMutableArray alloc] init];

//  [self.MainListTableView setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)];

    // Do any additional setup after loading the view.
    ofset=0;
   NSArray *Arr=[self daysThisWeek];
    if (Arr.count>0) {
        NSDate *sdate=[Arr firstObject];
        NSDate *lDate=[Arr lastObject];
        NSDateFormatter *datv=[[NSDateFormatter alloc]init];
        [datv setDateStyle:NSDateFormatterFullStyle];
        NSString *SdatStr=[datv stringFromDate:sdate];
        NSString *ldatStr=[datv stringFromDate:lDate];
       
        NSString *month;
        NSString *year;
        [datv setDateFormat:@"dd"];
         ldatStr=[datv stringFromDate:lDate];
        SdatStr = [datv stringFromDate:sdate];
        
        [datv setDateFormat:@"MMMM"];
        
        month = [datv stringFromDate:sdate];
        
        [datv setDateFormat:@"yy"];
        
        year=[datv stringFromDate:sdate];
        
        Datelab.text=[NSString stringWithFormat:@"%@ %@-%@, %@",month,SdatStr,ldatStr,year];    }
  
    
}
-(NSArray*)daysThisWeek
{
    return  [self daysInWeek:1 fromDate:[NSDate date]];
}

-(NSArray*)daysNextWeek
{
    return  [self daysInWeek:1 fromDate:[NSDate date]];
    
}
-(NSArray*)daysInWeek:(int)weekOffset fromDate:(NSDate*)date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    //ask for current week
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    comps=[calendar components:NSWeekCalendarUnit|NSYearCalendarUnit fromDate:date];
    //create date on week start
    NSDate* weekstart=[calendar dateFromComponents:comps];
    if (weekOffset>0) {
        NSDateComponents* moveWeeks=[[NSDateComponents alloc] init];
        moveWeeks.week=1;
        weekstart=[calendar dateByAddingComponents:moveWeeks toDate:weekstart options:0];
    }
    
    //add 7 days
    NSMutableArray* week=[NSMutableArray arrayWithCapacity:7];
    for (int i=1; i<=7; i++) {
        NSDateComponents *compsToAdd = [[NSDateComponents alloc] init];
        compsToAdd.day=i;
        NSDate *nextDate = [calendar dateByAddingComponents:compsToAdd toDate:weekstart options:0];
        [week addObject:nextDate];
        
    }
    return [NSArray arrayWithArray:week];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    
    if ([[NSUserDefaults standardUserDefaults]objectForKey:@"New Resolve"]) {
        Addsolve=[[NSUserDefaults standardUserDefaults]objectForKey:@"New Resolve"];
    }else {}
        
    [MainListTableView reloadData];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [Addsolve count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"MainList";
    LIstTableViewCell *cell = (LIstTableViewCell*)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[LIstTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        
    }
    NSDictionary *dic = [Addsolve objectAtIndex:indexPath.section];
    cell.ResolveNameLab.text = [dic objectForKey:@"resolvedname"];
   cell.PoinValueLab.text = [dic objectForKey:@"ResolvePoint"];
    cell.separatorInset = UIEdgeInsetsZero;

    id offen=[dic objectForKey:@"howofen"];
    if ([offen isKindOfClass:[NSArray class]]) {
        
        NSArray *dayArr=(NSArray*)offen;
        cell.DayWeeKView.hidden=NO;
        
        for (int i=0; i<dayArr.count; i++) {
        
            if ([[dayArr objectAtIndex:i] isEqualToString:@"Monday"]) {
                [cell.Mon setBackgroundImage:[UIImage imageNamed:@"blue.png"] forState:UIControlStateNormal];
                [cell.Mon setTitle:@"Mon" forState:UIControlStateNormal];
            }else if ([[dayArr objectAtIndex:i] isEqualToString:@"Tuesday"]) {
                [cell.Tue setBackgroundImage:[UIImage imageNamed:@"blue.png"] forState:UIControlStateNormal];
                 [cell.Tue setTitle:@"Tue" forState:UIControlStateNormal];
            }else if ([[dayArr objectAtIndex:i] isEqualToString:@"Wednesday"]) {
                [cell.Wed setBackgroundImage:[UIImage imageNamed:@"blue.png"] forState:UIControlStateNormal];
                [cell.Wed setTitle:@"Wed" forState:UIControlStateNormal];

            }else if ([[dayArr objectAtIndex:i] isEqualToString:@"Thursday"]) {
                [cell.Thu setBackgroundImage:[UIImage imageNamed:@"blue.png"] forState:UIControlStateNormal];
                [cell.Thu setTitle:@"Thu" forState:UIControlStateNormal];

            }else if ([[dayArr objectAtIndex:i] isEqualToString:@"Friday"]) {
                [cell.Fri setBackgroundImage:[UIImage imageNamed:@"blue.png"] forState:UIControlStateNormal];
                [cell.Fri setTitle:@"Fri" forState:UIControlStateNormal];

            }else if ([[dayArr objectAtIndex:i] isEqualToString:@"Saturday"]) {
                [cell.Sat setBackgroundImage:[UIImage imageNamed:@"blue.png"] forState:UIControlStateNormal];
                [cell.Sat setTitle:@"Sat" forState:UIControlStateNormal];

            }else if ([[dayArr objectAtIndex:i] isEqualToString:@"Sunday"]) {
                [cell.Sun setBackgroundImage:[UIImage imageNamed:@"blue.png"] forState:UIControlStateNormal];
                [cell.Sun setTitle:@"Sun" forState:UIControlStateNormal];
            }
        }
        
    }else if([offen isKindOfClass:[NSString class]]){
        cell.DayWeeKView.hidden=YES;
        cell.OneWeekLab.text=[dic objectForKey:@"howofen"];

    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
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


-(void)viewWillDisappear:(BOOL)animated{
    

}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)EditBtnAct:(id)sender {
    
    [self performSegueWithIdentifier:@"Portrait6" sender:self];
}

- (IBAction)RewardActBtn:(id)sender {
    [self performSegueWithIdentifier:@"Reward" sender:self];
}







//[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"calshow://"]];



@end
