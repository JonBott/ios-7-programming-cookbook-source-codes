//
//  ViewController.m
//  Displaying Long Lines of Text with UITextView
//
//  Created by Vandad NP on 23/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic, strong) UITextView *myTextView;

@end

@implementation ViewController



- (void)viewWillAppear:(BOOL)paramAnimated
{
	[super viewWillAppear:paramAnimated];

//	[self createSimpleUITextView];
	[self createUITextThatHandlesKeyboardResizing];

}

- (void)viewWillDisappear:(BOOL)paramAnimated
{
	[super viewWillDisappear:paramAnimated];

	[self cleanUp];
}


#pragma mark - worker methods
- (void)createSimpleUITextView
{
	self.myTextView = [[UITextView alloc] initWithFrame:self.view.bounds];
	self.myTextView.layer.borderWidth = 5.0f;
	self.myTextView.layer.borderColor = UIColor.grayColor.CGColor;
	self.myTextView.text = @"Some text here...";
	self.myTextView.contentInset = UIEdgeInsetsMake(10.0f, 0.0f, 0.0f, 0.0f);
	self.myTextView.font = [UIFont systemFontOfSize:16.0f];
	[self.view addSubview:self.myTextView];
}

- (void)createUITextThatHandlesKeyboardResizing
{
	[NSNotificationCenter.defaultCenter addObserver:self selector:@selector(handleKeyboardDidShow:)  name:UIKeyboardDidShowNotification  object:nil];
	[NSNotificationCenter.defaultCenter addObserver:self selector:@selector(handleKeyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];

	self.myTextView = [[UITextView alloc] initWithFrame:self.view.bounds];
	self.myTextView.text = [@"" stringByPaddingToLength:1000 withString:@"abc" startingAtIndex:0]; //@"Some text here...";
	self.myTextView.font = [UIFont systemFontOfSize:16.0f];
	self.myTextView.scrollEnabled = true;

	[self.view addSubview:self.myTextView];
}


#pragma mark - events

- (void)handleKeyboardDidShow:(NSNotification *)paramNotification
{
	CGRect keyboardRect = CGRectZero;

	NSValue *keyboardRectAsObject = [paramNotification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey]; // Get the frame of the keyboard
	[keyboardRectAsObject getValue:&keyboardRect];

	self.myTextView.contentInset =  UIEdgeInsetsMake(0.0f, 0.0f, keyboardRect.size.height, 0.0f); // Give a bottom margin to our text view that makes it reach to the top of the keyboard
}

- (void)handleKeyboardWillHide:(NSNotification *)paramNotification
{
	self.myTextView.contentInset = UIEdgeInsetsZero; // Make the text view as big as the whole view again
}


#pragma mark - private methods

- (void)cleanUp
{
	[NSNotificationCenter.defaultCenter removeObserver:self];
}

@end
