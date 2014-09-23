//
//  ViewController.m
//  Adding Buttons to the User Interface with UIButton
//
//  Created by Vandad NP on 23/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic, strong) UIButton *myButton;
@end

@implementation ViewController

- (void)viewDidLoad
{

	[super viewDidLoad];

	[self createSystemButton];
//	[self createCustomButton];

}

#pragma mark - creation methods

- (void)createSystemButton
{
	self.myButton = [UIButton buttonWithType:UIButtonTypeSystem];

	self.myButton.frame = CGRectMake(110.0f, 200.0f, 100.0f, 44.0f);

	[self.myButton setTitle:@"Press Me"    forState:UIControlStateNormal];
	[self.myButton setTitle:@"I'm Pressed" forState:UIControlStateHighlighted];

//	[self.myButton addTarget:self action:@selector(buttonIsPressed:) forControlEvents:UIControlEventTouchDown];  //duplicates fire event
	[self.myButton addTarget:self action:@selector(buttonIsTapped:)  forControlEvents:UIControlEventTouchUpInside];

	[self.view addSubview:self.myButton];

}


- (void)createCustomButton
{
	UIImage *normalImage = [UIImage imageNamed:@"NormalBlueButton"];
	UIImage *highlightedImage = [UIImage imageNamed:@"HighlightedBlueButton"];

	self.myButton = [UIButton buttonWithType:UIButtonTypeCustom];

	self.myButton.frame = CGRectMake(110.0f, 200.0f, 100.0f, 44.0f);

	[self.myButton setBackgroundImage:normalImage forState:UIControlStateNormal];
	[self.myButton setBackgroundImage:highlightedImage forState:UIControlStateHighlighted];

	[self.myButton setTitle:@"Normal" forState:UIControlStateNormal];
	[self.myButton setTitle:@"Pressed" forState:UIControlStateHighlighted];

//	[self.myButton addTarget:self action:@selector(buttonIsPressed:) forControlEvents:UIControlEventTouchDown];
	[self.myButton addTarget:self action:@selector(buttonIsTapped:) forControlEvents:UIControlEventTouchUpInside];

	[self.view addSubview:self.myButton];
}

#pragma mark - events

- (void)buttonIsPressed:(UIButton *)paramSender
{
	NSLog(@"Button is pressed.");
}

- (void)buttonIsTapped:(UIButton *)paramSender
{
	NSLog(@"Button is tapped.");
}

@end
