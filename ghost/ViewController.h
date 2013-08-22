//
//  ViewController.h
//  ghost
//
//  Created by sagiyashinji on 2013/08/07.
//  Copyright (c) 2013年 spec5zigen Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *oImg;
//
@property (weak, nonatomic) IBOutlet UIButton *oGhostBtn;
@property (weak, nonatomic) IBOutlet UIButton *oAnimateBtn;
//
- (IBAction)doGhost:(id)sender;
- (IBAction)doAnimate:(id)sender;

@end
