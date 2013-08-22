//
//  ViewController.m
//  ghost
//
//  Created by sagiyashinji on 2013/08/07.
//  Copyright (c) 2013年 spec5zigen Inc. All rights reserved.
//

#import "ViewController.h"

#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
	
	//
	self.oAnimateBtn.layer.cornerRadius = 5.0f;
	self.oGhostBtn.layer.cornerRadius = 5.0f;
	self.oAnimateBtn.enabled = NO;
	self.oAnimateBtn.alpha = 0.5;
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
}

- (IBAction)doGhost:(id)sender {
	if(self.oImg.layer.mask){
		self.oImg.layer.mask = nil;
		//
		self.oAnimateBtn.enabled = NO;
		self.oAnimateBtn.alpha = 0.5;
	}
	else{
		UIImage *img = [UIImage imageNamed:@"mask.png"];
		CALayer *mask = [CALayer layer];
		mask.contents = (id)[img CGImage];
		mask.frame = CGRectMake(0,0,img.size.width,img.size.height);
		self.oImg.layer.mask = mask;
		//
		self.oAnimateBtn.enabled = YES;
		self.oAnimateBtn.alpha = 1.0;
	}
}


- (IBAction)doAnimate:(id)sender
{
	NSString *animKey = @"positionAnimation";
	if([self.oImg.layer.mask animationForKey:animKey]){
		[self.oImg.layer.mask removeAnimationForKey:animKey];
		return;
	}

	CGPoint fromPt = self.oImg.layer.mask.position;
	CGPoint toPt = fromPt;
	
	CGFloat baseY = self.oImg.layer.mask.frame.size.height / 2.0;
	if(fromPt.y == baseY){
		toPt.y = baseY - 30;
	}
	else{
		toPt.y = baseY;
	}

	CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"position"];
	anim.repeatCount = HUGE_VALF;
	anim.duration = 1.4;
	anim.fromValue = [NSValue valueWithCGPoint:fromPt];
	anim.toValue = [NSValue valueWithCGPoint:toPt];

	anim.autoreverses = YES;
	anim.removedOnCompletion = NO;
	self.oImg.layer.mask.position = toPt;
	[self.oImg.layer.mask addAnimation:anim forKey:animKey];
}
@end
