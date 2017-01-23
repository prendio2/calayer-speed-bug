//
//  ViewController.m
//  Layer speed test
//
//  Created by Oisin Prendiville on 19/01/2017.
//  Copyright © 2017 Supertop. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UISwitch *statusBarSwitch;

@end

@implementation ViewController

- (IBAction)didTap:(UITapGestureRecognizer *)sender
{
  UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
  view.backgroundColor = [UIColor redColor];
  view.center = [sender locationInView:self.view];
  view.layer.speed = 0.1f;
  [self.view addSubview:view];
  
  [UIView animateWithDuration:0.25f animations:^{
    view.center = CGPointMake(view.center.x, -100.0f);
  } completion:^(BOOL finished) {
    [view removeFromSuperview];
  }];
}

- (IBAction)statusBarSwitchChanged:(id)sender
{
  [self setNeedsStatusBarAppearanceUpdate];
}

- (BOOL)prefersStatusBarHidden
{
  return self.statusBarSwitch != nil && !self.statusBarSwitch.isOn;
}

@end
