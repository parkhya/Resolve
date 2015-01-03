//
//  ViewController.m
//  Resolved
//
//  Created by Abc on 29/12/14.
//  Copyright (c) 2014 Parkhya. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer *viewTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(SelfViewTapped:)];
    [self.view addGestureRecognizer:viewTap];
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
   
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)SelfViewTapped:(UITapGestureRecognizer*)sender
{
    [self performSegueWithIdentifier:@"Mainlist" sender:self];
    //By tag, you can find out where you had typed.
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
