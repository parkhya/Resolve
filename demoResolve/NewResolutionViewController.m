//
//  NewResolutionViewController.m
//  Resolved
//
//  Created by Abc on 30/12/14.
//  Copyright (c) 2014 Parkhya. All rights reserved.
//

#import "NewResolutionViewController.h"
#import "LIstTableViewCell.h"

@interface NewResolutionViewController ()
{
     UIPickerView *myPickerView;
     NSArray *pickerArray;
     NSMutableArray *AdminList;
     NSMutableArray *Addlist;
     NSDictionary *List;
     NSString *points;
     NSIndexPath* checkedIndexPath;
     NSString *Listdata;
     NSMutableArray *WeekData;
     NSMutableArray  *Weeklist;
     NSMutableArray *Xarr;
     BOOL isWeek;
}

@end

@implementation NewResolutionViewController

@synthesize ResolveLab,OFTENListTableView,Segment,Point,WeektableView,TimePerLab,DayLab;
- (void)viewDidLoad {
    [super viewDidLoad];
    if (AdminList==nil)
    {
        AdminList=[[NSMutableArray alloc]initWithObjects:@"Monday", @"Tuesday", @"Wednesday", @"Thursday", @"Friday",@"Saturday",@"Sunday", nil];
    }
    if (Weeklist==nil)
    {
        Weeklist=[[NSMutableArray alloc]initWithObjects:@"Once per week", @"Twice Per Week", @"3 times per week ", @"4 times per week",@"5 times per week",@"6 times per week",@"Everyday", nil];
    }
    if (Xarr==nil) {
        Xarr=[[NSMutableArray alloc]initWithObjects:@"1x Every Week", @"2x Every Week", @"3x Every Week ", @"4x Every Week",@"5x Every Week",@"6x Every Week",@"Everyday", nil];
    }
    
    [self.OFTENListTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]
                                        animated:NO
                                  scrollPosition:UITableViewScrollPositionTop];
    [self.WeektableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]
                                    animated:NO
                              scrollPosition:UITableViewScrollPositionTop];
    
     Addlist =[[NSMutableArray alloc]init];
    WeekData=[[NSMutableArray alloc]init];
    [WeekData addObject:@"Monday"];
    Listdata=@"Once Per Week";
    if ([[NSUserDefaults standardUserDefaults]objectForKey:@"New Resolve"]) {
        Addlist=[[NSMutableArray alloc]initWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:@"New Resolve"]];
    }
    pickerArray = [[NSArray alloc]initWithObjects:@"1",
                   @"2",@"3",@"4",@"5", @"6",@"7",@"8",@"9",@"10", nil];
    myPickerView = [[UIPickerView alloc]init];
    myPickerView.dataSource = self;
    myPickerView.delegate = self;
    myPickerView.showsSelectionIndicator = YES;
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Done" style:UIBarButtonItemStyleDone
                                   target:self action:@selector(done:)];
    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:
                          CGRectMake(0, self.view.frame.size.height-
                                     myPickerView.frame.size.height-50, 320, 50)];
    myPickerView.backgroundColor = [UIColor whiteColor];


//    [toolBar setBarStyle:UIBarStyleDefault];
    toolBar.tintColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"Rectangle 159.png"]];
    toolBar.barTintColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"Menubar Background reward.png"]];
    NSArray *toolbarItems = [NSArray arrayWithObjects:
                             doneButton, nil];
    [toolBar setItems:toolbarItems];
    self.Point.inputView = myPickerView;
    self.Point.inputAccessoryView = toolBar;
    // Do any additional setup after loading the view.
   
//    Weeklist =[[NSMutableArray  alloc]init];
//    [OFTENListTableView selectRowAtIndexPath:0
//                          animated:NO
//                    scrollPosition:UITableViewScrollPositionTop];
//    [WeektableView selectRowAtIndexPath:0
//                                    animated:NO
//                              scrollPosition:UITableViewScrollPositionTop];
    }

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
#pragma mark - UITableView Delegate & Datasrouce -

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    if (tableView==OFTENListTableView)
    {
        return [AdminList count];
    }
    if (tableView==WeektableView)
    {
        return [Weeklist count];
    }
    return 0;}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *simpleTableIdentifier = @"SimpaltableCell";
    
    LIstTableViewCell *cell = (LIstTableViewCell*)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
     cell = [[LIstTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
         }
    
    
   
    
    // Configure the cell...
    
    if(tableView==OFTENListTableView)
    {
        cell.textLabel.text=[AdminList objectAtIndex:indexPath.row];
        if (indexPath.row==0){
        
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
                   [OFTENListTableView selectRowAtIndexPath:0
                                                    animated:NO
                                            scrollPosition:UITableViewScrollPositionTop];
        } }
     if(tableView==WeektableView) {
        cell.textLabel.text=[Weeklist objectAtIndex:indexPath.row];
        
         if (indexPath.row==0){
             
             cell.accessoryType = UITableViewCellAccessoryCheckmark;
             [OFTENListTableView selectRowAtIndexPath:0
                                             animated:NO
                                       scrollPosition:UITableViewScrollPositionTop];
         }            }
    
    
    return cell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
   
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
   cell.accessoryType = UITableViewCellAccessoryCheckmark;
    if(tableView==OFTENListTableView)
    {
         [WeekData addObject:[AdminList objectAtIndex:indexPath.row]];
    }
    if(tableView==WeektableView) {
        Listdata=[Xarr objectAtIndex:indexPath.row];

    }
    
   // [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
   
   
    if(tableView==WeektableView) {
        [WeekData removeObject:[AdminList objectAtIndex:indexPath.row]];
    }

    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryNone;

}




- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)NewReslvedSaveBTn:(id)sender {
     
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
      if (ResolveLab.text.length>0 && self.Point.text.length>0) {
        NSMutableDictionary *Dic2=[[NSMutableDictionary alloc]init];
        if (isWeek) {
             [Dic2 setValue:Listdata forKey:@"howofen"];
        }else
             [Dic2 setValue:WeekData forKey:@"howofen"];
       
        [Dic2 setValue:ResolveLab.text forKey:@"resolvedname"];
         [Dic2 setValue:self.Point.text forKey:@"ResolvePoint"];
        
        [Addlist addObject:Dic2];
        [defaults setValue:Addlist forKey:@"New Resolve"];
        [self.navigationController popViewControllerAnimated:YES];
        

    }else
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Please Enter Resolve name And Point" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alert show];
    }

    
   }

- (IBAction)RightBtnAct:(id)sender {
}

- (IBAction)CancelBtb:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)ChangeSegment:(id)sender;{
    
    UISegmentedControl *seg=(UISegmentedControl*)sender;
    
    switch (self.Segment.selectedSegmentIndex) {
        case 0:
             WeektableView.hidden=YES;
            DayLab.hidden=NO;
            TimePerLab.hidden=YES;
            isWeek=NO;
            [OFTENListTableView reloadData];
            [ResolveLab resignFirstResponder];
            break;
        case 1:
            isWeek=YES;
            WeektableView.hidden=NO;
            TimePerLab.hidden=NO;
            DayLab.hidden=YES;
             [ResolveLab resignFirstResponder];
            [WeektableView reloadData];
        default:
            break;
    }
}

#pragma mark - Picker View Data source
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component{
    return [pickerArray count];
}

#pragma mark- Picker View Delegate

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:
(NSInteger)row inComponent:(NSInteger)component{
    [self.Point setText:[pickerArray objectAtIndex:row]];
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:
(NSInteger)row forComponent:(NSInteger)component{
    return [pickerArray objectAtIndex:row];
}

-(void)done:(id)sender;{
    [self.Point resignFirstResponder];

}
#pragma mark -UITextField Delegate

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField==Point) {
        self.view.frame=CGRectMake(0, -250, self.view.frame.size.width,self.view.frame.size.height);
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField==Point) {
        self.view.frame=CGRectMake(0, 0,self.view.frame.size.width,self.view.frame.size.height);
    }
}
@end
