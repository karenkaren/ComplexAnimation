//
//  ViewController.m
//  Test
//
//  Created by LiuFeifei on 16/6/22.
//  Copyright © 2016年 LiuJie. All rights reserved.
//

#import "ViewController.h"
#import "AnimationView.h"
#import "UIColor+LJ.h"

@interface ViewController ()<AnimatiomViewDelegate>

@property (strong, nonatomic) AnimationView * animationView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initAnimationView];
}

- (void)initAnimationView
{
    CGFloat size = 100.0f;
    self.animationView = [[AnimationView alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.view.frame) / 2 - size / 2, CGRectGetHeight(self.view.frame) / 2 - size / 2, size, size)];
    self.animationView.delegate = self;
    self.animationView.parentFrame = self.view.frame;
    [self.view addSubview:self.animationView];
}

- (void)completeAnimation
{
    [self.animationView removeFromSuperview];
    self.view.backgroundColor = [UIColor lj_colorWithHexString:@"#40e0b0"];
    
    UILabel *label = [[UILabel alloc] initWithFrame:self.view.frame];
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:50];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"Welcome";
    label.transform = CGAffineTransformScale(label.transform, 0.25, 0.25);
    [self.view addSubview:label];
    
    [UIView animateWithDuration:2 delay:0.0 usingSpringWithDamping:0.7 initialSpringVelocity:0.1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        label.transform = CGAffineTransformScale(label.transform, 4.0, 4.0);
    } completion:^(BOOL finished) {
        self.view.backgroundColor = [UIColor whiteColor];
        [label removeFromSuperview];
        self.animationView = nil;
        [self initAnimationView];
    }];
}

@end
