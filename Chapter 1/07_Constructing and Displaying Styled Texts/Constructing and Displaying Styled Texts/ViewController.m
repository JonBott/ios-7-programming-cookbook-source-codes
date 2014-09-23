//
//  ViewController.m
//  Constructing and Displaying Styled Texts
//
//  Created by Vandad NP on 23/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic, strong) UILabel *label;
@end

@implementation ViewController

- (void)viewDidLoad
{
	[super viewDidLoad];

	[self labelWithAttributedText];

}

- (void)labelWithAttributedText
{
	self.label = [UILabel new];
	self.label.backgroundColor = UIColor.clearColor;
	self.label.attributedText = self.attributedText;

	[self.label sizeToFit];
	self.label.center = self.view.center;

	[self.view addSubview:self.label];
}

- (NSAttributedString *)attributedText
{
	NSShadow *shadow = [NSShadow new];
	shadow.shadowColor = UIColor.darkGrayColor;
	shadow.shadowOffset = CGSizeMake(4.0f, 4.0f);

	NSDictionary *attributesForFirstWord = @{
			NSFontAttributeName            : [UIFont boldSystemFontOfSize:60.0f],
			NSForegroundColorAttributeName : UIColor.redColor,
			NSBackgroundColorAttributeName : UIColor.blackColor
	};


	NSDictionary *attributesForSecondWord = @{
			NSFontAttributeName            : [UIFont boldSystemFontOfSize:60.0f],
			NSForegroundColorAttributeName : UIColor.whiteColor,
			NSBackgroundColorAttributeName : UIColor.redColor,
			NSShadowAttributeName          : shadow
	};


	NSString *string = @"iOS SDK";

	NSMutableAttributedString *result = [[NSMutableAttributedString alloc] initWithString:string];

	[result setAttributes:attributesForFirstWord range:[string rangeOfString:@"iOS"]]; //Find the string "iOS" in the whole string and sets its attribute
	[result setAttributes:attributesForSecondWord range:[string rangeOfString:@"SDK"]]; //Do the same thing for the string "SDK"

	return [[NSAttributedString alloc] initWithAttributedString:result];
}

@end
