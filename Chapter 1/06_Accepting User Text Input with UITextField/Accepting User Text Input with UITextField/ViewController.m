//
//  ViewController.m
//  Accepting User Text Input with UITextField
//
//  Created by Vandad NP on 23/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@property(nonatomic, strong) UITextField *myTextField;
@property(nonatomic, strong) UILabel *labelCounter;

@end

@implementation ViewController

- (void)viewDidLoad
{
	[super viewDidLoad];

//	[self createSimpleTextfield];
//	[self createSimpleTextfieldWithDelegate];
//	[self textfield_withDefaultText];
//	[self textfield_withPlaceholder];
	[self textfield_withKeyboardTypeAndLabel];

}

- (void)createSimpleTextfieldWithDelegate
{
	[self createSimpleTextfield];

	self.myTextField.delegate = self;
}

- (void)textfield_withDefaultText
{
	[self createSimpleTextFieldWithLabel];

	self.myTextField.text = @"Sir Richard Branson";

	[self calculateAndDisplayTextFieldLengthWithText:self.myTextField.text];
}

- (void)textfield_withPlaceholder
{
	[self createSimpleTextFieldWithLabel];

	self.myTextField.placeholder = @"Enter text here...";

	[self calculateAndDisplayTextFieldLengthWithText:self.myTextField.text];
}

- (void)textfield_withKeyboardTypeAndLabel
{
	self.myTextField = [[UITextField alloc] initWithFrame:CGRectMake(38.0f, 30.0f, 240.0f, 31.0f)];
	self.myTextField.placeholder = @"Enter amount here.";
	self.myTextField.keyboardType = UIKeyboardTypeDecimalPad;
	self.myTextField.borderStyle = UITextBorderStyleRoundedRect;
	self.myTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
	self.myTextField.textAlignment = NSTextAlignmentLeft;
	self.myTextField.leftViewMode = UITextFieldViewModeAlways;

	UILabel *currencyLabel = [[UILabel alloc] initWithFrame:CGRectZero];
	currencyLabel.text = [NSNumberFormatter new].currencySymbol;
	currencyLabel.font = self.myTextField.font;
	[currencyLabel sizeToFit];

	self.myTextField.leftView = currencyLabel;

	[self.view addSubview:self.myTextField];
}


#pragma mark - helper methods

- (void)createSimpleTextFieldWithLabel
{
	CGRect textFieldFrame = CGRectMake(38.0f, 30.0f, 220.0f, 31.0f);

	CGRect labelCounterFrame = self.myTextField.frame;
	labelCounterFrame.origin.y += textFieldFrame.size.height + 10;

	self.labelCounter = [[UILabel alloc] initWithFrame:labelCounterFrame];
	[self.view addSubview:self.labelCounter];

	self.myTextField = [[UITextField alloc] initWithFrame:textFieldFrame];
	self.myTextField.delegate = self;
	self.myTextField.borderStyle = UITextBorderStyleRoundedRect;
	self.myTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
	self.myTextField.textAlignment = NSTextAlignmentCenter;

	[self.view addSubview:self.myTextField];
}

- (void)createSimpleTextfield
{
	self.myTextField = [[UITextField alloc] initWithFrame: CGRectMake(0.0f, 0.0f, 200.0f, 31.0f)];
	self.myTextField.borderStyle = UITextBorderStyleRoundedRect;
	self.myTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
	self.myTextField.textAlignment = NSTextAlignmentCenter;
	self.myTextField.center = self.view.center;
	self.myTextField.text = @"Sir Richard Branson";

	[self.view addSubview:self.myTextField];
}

#pragma mark - private methods

- (void)calculateAndDisplayTextFieldLengthWithText:(NSString *)paramText
{
	NSString *characterOrCharacters = @"Characters";
	if(paramText.length == 1)
	{
			characterOrCharacters = @"Character";
	}

	NSString *someString = [NSString stringWithFormat:@"%lu %@", (unsigned long) paramText.length, characterOrCharacters];
	self.labelCounter.text = someString;

	NSLog(someString);
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
	NSLog(@"finished editing");
}


#pragma mark - events

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
	if([textField isEqual:self.myTextField])
	{
		NSString *wholeText = [textField.text stringByReplacingCharactersInRange:range withString:string];
		[self calculateAndDisplayTextFieldLengthWithText:wholeText];

		if([string isEqualToString:@"k"])
			return NO;
	}

	return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
	return YES;
}


@end