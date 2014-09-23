//
//  ViewController.m
//  Creating and Using Switches with UISwitch
//
//  Created by Vandad NP on 22/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UISwitch *mySwitch;

@end

@implementation ViewController


- (void)viewDidLoad
{
	[super viewDidLoad];

//	[self createSimpleSwitch];
//	[self createSimpleSwitchOn];
//	[self switchCheckOn];

	[self bestExample__createSwitchWithEvent];

}


- (void)bestExample__createSwitchWithEvent
{
	self.mySwitch = [[UISwitch alloc] initWithFrame: CGRectMake(100, 100, 0, 0)];
	self.mySwitch.on = YES;

	[self.mySwitch addTarget:self action:@selector(switchIsChanged:) forControlEvents:UIControlEventValueChanged];

	[self.view addSubview:self.mySwitch];
}

- (void)createSimpleSwitch
{
	self.mySwitch = [[UISwitch alloc] initWithFrame: CGRectMake(100, 100, 0, 0)];

	[self.view addSubview:self.mySwitch];
}

- (void)createSimpleSwitchOn
{
	self.mySwitch = [[UISwitch alloc] initWithFrame: CGRectMake(100, 100, 0, 0)];
	[self.mySwitch setOn:YES];

	[self.view addSubview:self.mySwitch];
}

- (void)switchCheckOn
{
	self.mySwitch = [[UISwitch alloc] initWithFrame: CGRectMake(100, 100, 0, 0)];
	self.mySwitch.on = NO;//YES;  //	[self.mySwitch setOn:YES];

	[self.view addSubview:self.mySwitch];

	if(self.mySwitch.on) //	if([self.mySwitch isOn])
	{
		NSLog(@"The switch is on.");
	}
	else
	{
		NSLog(@"The switch is off.");
	}

}

#pragma mark - Switch changed

- (void) switchIsChanged:(UISwitch *)pSwitch
{
	NSLog(@"Sender is = %@", pSwitch);

	if (pSwitch.on){
		NSLog(@"The switch is turned on.");
	} else {
		NSLog(@"The switch is turned off.");
	}

}

@end
