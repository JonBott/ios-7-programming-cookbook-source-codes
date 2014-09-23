//
//  ViewController.m
//  Customizing the UISwitch
//
//  Created by Vandad NP on 22/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UISwitch *mainSwitch;
@end

@implementation ViewController


/* Note: This is only for iOS 6 and older */
- (void)viewDidLoad
{
    [super viewDidLoad];

//	[self createSwitchOld];
	[self createSwitchNew];
}

- (void)createSwitchNew
{
	[self createSwitch];

	/* Customize the switch */


	self.mainSwitch.tintColor = [UIColor redColor];  // Adjust the off-mode tint color
	self.mainSwitch.onTintColor = [UIColor brownColor]; // Adjust the on-mode tint color
	self.mainSwitch.thumbTintColor = [UIColor greenColor];  // Also change the knob's tint color

}

- (void)createSwitch
{
	self.mainSwitch = [[UISwitch alloc] initWithFrame:CGRectZero];
	self.mainSwitch.center = self.view.center;
	[self.view addSubview:self.mainSwitch];
}

- (void)createSwitchOld
{
	[self createSwitch];

	/* Customize the switch */
	self.mainSwitch.onImage = [UIImage imageNamed:@"On"];
	self.mainSwitch.offImage = [UIImage imageNamed:@"Off"];
}


@end
