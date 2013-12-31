//
//  SSViewController.m
//  RollingScrollView
//
//  Created by Shawn Seals on 12/27/13.
//  Copyright (c) 2013 Shawn Seals. All rights reserved.
//

#import "SSViewController.h"
#import "SSRollingButtonScrollView.h"

@interface SSViewController ()
{
    NSArray *_buttonTitleArray;
}

@end

@implementation SSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _buttonTitleArray = [NSArray arrayWithObjects:@"One", @"Two", @"Three", @"Four", @"Five", @"Six", @"Seven", @"Eight", @"Nine", @"Ten", @"Eleven", @"Twelve", @"Thirteen", @"Fourteen", nil];
    
    [self.rollinButtonScrollView setLayoutStyle:SShorizontalLayout];
    [self.rollinButtonScrollView setButtonTitles:_buttonTitleArray];
    [self.rollinButtonScrollView createButtonArray];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
