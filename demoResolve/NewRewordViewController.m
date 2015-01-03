//
//  NewRewordViewController.m
//  Resolved
//
//  Created by Abc on 31/12/14.
//  Copyright (c) 2014 Parkhya. All rights reserved.
//

#import "NewRewordViewController.h"
#import "LIstTableViewCell.h"

@interface NewRewordViewController ()
{
    
    UIPickerView *myPickerView;
    NSArray *pointArray;
    NSMutableArray *AddReward;
    

}


@end

@implementation NewRewordViewController
@synthesize  RewardName,RewardPoint;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    pointArray = [[NSArray alloc]initWithObjects:@"1",
                   @"2",@"3",@"4",@"5", @"6",@"7",@"8",@"9",@"10", @"15",@"20",@"25",@"50", @"100",@"150",@"200",@"250",@"500", nil];
    myPickerView = [[UIPickerView alloc]init];
    myPickerView.dataSource = self;
    myPickerView.delegate = self;
    myPickerView.showsSelectionIndicator = YES;
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Done" style:UIBarButtonItemStyleDone
                                   target:self action:@selector(done:)];
    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:
                          CGRectMake(0, self.view.frame.size.height-
                                     myPickerView.frame.size.height-250, 320, 50)];

    myPickerView.backgroundColor = [UIColor whiteColor];
    toolBar.tintColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"Rectangle 159.png"]];
    toolBar.barTintColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"Menubar Background reward.png"]];
    NSArray *toolbarItems = [NSArray arrayWithObjects:
                             doneButton, nil];
    [toolBar setItems:toolbarItems];
    self.RewardPoint.inputView = myPickerView;
    self.RewardPoint.inputAccessoryView = toolBar;
    UITapGestureRecognizer *viewTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(SelfViewTapped:)];
    [self.view addGestureRecognizer:viewTap];
    AddReward =[[NSMutableArray alloc]init];
    
    if ([[NSUserDefaults standardUserDefaults]objectForKey:@"New Reward"]) {
        AddReward=[[NSMutableArray alloc]initWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:@"New Reward"]];
    }
}
-(void)SelfViewTapped:(UITapGestureRecognizer*)sender
{
    [RewardName resignFirstResponder];
    [RewardPoint resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
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

    return cell;
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
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
}
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
}

- (IBAction)SaveReward:(id)sender {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    
    
    if (RewardName.text.length>0 && RewardPoint.text.length>0) {
        NSMutableDictionary *Dic2=[[NSMutableDictionary alloc]init];
       
        
        [Dic2 setValue:RewardName.text forKey:@"rewardname"];
        [Dic2 setValue:RewardPoint.text forKey:@"RewardPoint"];
         [
          AddReward addObject:Dic2];
        [defaults setValue:AddReward forKey:@"New Reward"];
         [self.navigationController popViewControllerAnimated:YES];
    }else
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Please Enter Reward name And Point" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alert show];
    }
}

- (IBAction)CancelReward:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
   }
#pragma mark - Picker View Data source
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component{
    return [pointArray count];
}

#pragma mark- Picker View Delegate

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:
(NSInteger)row inComponent:(NSInteger)component{
    [self.RewardPoint setText:[pointArray objectAtIndex:row]];
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:
(NSInteger)row forComponent:(NSInteger)component{
    return [pointArray objectAtIndex:row];
}

-(void)done:(id)sender;{
    [self.RewardPoint resignFirstResponder];
    
}

@end
