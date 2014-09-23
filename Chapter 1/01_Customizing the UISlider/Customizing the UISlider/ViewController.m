//
//  ViewController.m
//  Customizing the UISlider
//
//  Created by Vandad NP on 22/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UISlider *slider;

@end

@implementation ViewController


- (void)viewDidLoad{
    [super viewDidLoad];

//    [self createSlideWithColors];
    [self createSliderWithCustomImages];
}


- (void)createSliderWithCustomImages
{
    [super viewDidLoad];

    self.slider = [[UISlider alloc] initWithFrame: CGRectMake(0.0f, 0.0f, 218.0f, 23.0f)];
    self.slider.value = 0.5;
    self.slider.minimumValue = 0.0f;
    self.slider.maximumValue = 1.0f;
    self.slider.center = self.view.center;

	self.slider.minimumValueImage = [UIImage imageNamed:@"MinimumValue"];
	self.slider.maximumValueImage = [UIImage imageNamed:@"MaximumValue"];

	[self.slider setThumbImage:[UIImage imageNamed:@"Thumb"] forState:UIControlStateNormal];
    [self.slider setThumbImage:[UIImage imageNamed:@"Thumb"] forState:UIControlStateHighlighted];

    [self.slider setMinimumTrackImage:self.minimumTrackImage forState:UIControlStateNormal];
    [self.slider setMaximumTrackImage:self.maximumTrackImage forState:UIControlStateNormal];

    [self.view addSubview:self.slider];

}

- (void)createSlideWithColors
{
    self.slider = [[UISlider alloc] initWithFrame: CGRectMake(0.0f, 0.0f, 118.0f, 23.0f)];
    self.slider.value = 0.5;
    self.slider.minimumValue = 0.0f;
    self.slider.maximumValue = 1.0f;
    self.slider.center = self.view.center;

    self.slider.minimumTrackTintColor = UIColor.redColor;
    self.slider.maximumTrackTintColor = UIColor.greenColor;
    self.slider.thumbTintColor = UIColor.blackColor;

    [self.view addSubview:self.slider];
}

- (UIImage *) minimumTrackImage
{
	UIImage *result = [UIImage imageNamed:@"MinimumTrack"];
	return [result resizableImageWithCapInsets: UIEdgeInsetsMake(0, 4, 0, 0)];
}

- (UIImage *) maximumTrackImage
{
	UIImage *result = [UIImage imageNamed:@"MaximumTrack"];
	return [result resizableImageWithCapInsets: UIEdgeInsetsMake(0, 0, 0, 3)];
}

@end
