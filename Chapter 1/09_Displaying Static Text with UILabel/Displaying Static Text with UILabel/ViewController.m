//
//  ViewController.m
//  Displaying Static Text with UILabel
//
//  Created by Vandad NP on 23/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic, strong) UILabel *myLabel;
@end

@implementation ViewController


- (void)viewDidLoad
{
	[super viewDidLoad];

//	[self createSimpleLabel];
//	[self createLabelWithAdjustableFont];
	[self createLabelWithNotWordWrapping];

}

- (void)createSimpleLabel
{
	self.myLabel = [[UILabel alloc] initWithFrame: CGRectMake(0.0f, 0.0f, 100.0f, 23.0f)];
	self.myLabel.text = @"iOS 7 Programming Cookbook";
	self.myLabel.font = [UIFont boldSystemFontOfSize:14.0f];
	self.myLabel.center = self.view.center;

	[self.view addSubview:self.myLabel];
}


- (void)createLabelWithAdjustableFont
{
	[self createSimpleLabel];

	self.myLabel.adjustsFontSizeToFitWidth = YES;
}


- (void)createLabelWithNotWordWrapping
{
	[self createSimpleLabel];

	CGRect rect = self.myLabel.frame;
	rect.size.height = 70.0f;
	self.myLabel.frame = rect;
	self.myLabel.numberOfLines = 3;
	self.myLabel.lineBreakMode = NSLineBreakByWordWrapping;

	//	self.myLabel.layer.borderColor = UIColor.blackColor.CGColor;
	//	self.myLabel.layer.borderWidth = 1.0f;

}

@end
