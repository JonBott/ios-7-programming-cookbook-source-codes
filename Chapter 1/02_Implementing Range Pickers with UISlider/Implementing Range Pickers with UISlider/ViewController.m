//
//  ViewController.m
//  Implementing Range Pickers with UISlider
//
//  Created by Vandad NP on 22/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UISlider *mySlider;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

//	[self createDefaultSlider];
//	[self addSliderWithCustomButtons];
	[self addSliderWithCallback];
    
}

- (void)createDefaultSlider
{
	self.mySlider = [[UISlider alloc] initWithFrame: CGRectMake(0.0f, 0.0f, 200.0f, 23.0f)];
	self.mySlider.center = self.view.center;
	self.mySlider.minimumValue = 0.0f;
	self.mySlider.maximumValue = 100.0f;
	self.mySlider.value = self.mySlider.maximumValue / 2.0;

	[self.view addSubview:self.mySlider];
}


- (void)addSliderWithCustomButtons
{
	[self createDefaultSlider];

	[self.mySlider setThumbImage:[UIImage imageNamed:@"ThumbNormal.png"] forState:UIControlStateNormal];
	[self.mySlider setThumbImage:[UIImage imageNamed:@"ThumbHighlighted.png"] forState:UIControlStateHighlighted];

	[self.view addSubview:self.mySlider];
}


#pragma mark - slider value changed

- (void)addSliderWithCallback
{
	[self createDefaultSlider];

	[self.mySlider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];

	[self.view addSubview:self.mySlider];
}



- (void) sliderValueChanged:(UISlider *)paramSender
{

	if (paramSender == self.mySlider)
	{
		NSLog(@"New value = %f", paramSender.value);
	}
}


@end
