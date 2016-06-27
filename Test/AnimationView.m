//
//  AnimationView.m
//  Test
//
//  Created by LiuFeifei on 16/6/22.
//  Copyright © 2016年 LiuJie. All rights reserved.
//

#import "AnimationView.h"
#import "CircleLayer.h"
#import "TriangleLayer.h"
#import "RectangleLayer.h"
#import "WaveLayer.h"
#import "UIColor+LJ.h"

@interface AnimationView ()

@property (strong, nonatomic) CircleLayer * circleLayer;
@property (strong, nonatomic) TriangleLayer * triangleLayer;
@property (strong, nonatomic) RectangleLayer * rectangleLayer;
@property (strong, nonatomic) WaveLayer * waveLayer;

@end

@implementation AnimationView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self addCircleLayer];
    }
    return self;
}

- (CircleLayer *)circleLayer
{
    if (!_circleLayer) {
        _circleLayer = [[CircleLayer alloc] init];
    }
    return _circleLayer;
}

- (TriangleLayer *)triangleLayer
{
    if (!_triangleLayer) {
        _triangleLayer = [[TriangleLayer alloc] init];
    }
    return _triangleLayer;
}

- (RectangleLayer *)rectangleLayer
{
    if (!_rectangleLayer) {
        _rectangleLayer = [[RectangleLayer alloc] init];
    }
    return _rectangleLayer;
}

- (WaveLayer *)waveLayer
{
    if (!_waveLayer) {
        _waveLayer = [[WaveLayer alloc] init];
    }
    return _waveLayer;
}

- (void)addCircleLayer
{
    [self.layer addSublayer:self.circleLayer];
    [self.circleLayer expand];
    [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(wobbleCircleLayer) userInfo:nil repeats:NO];
}

- (void)wobbleCircleLayer
{
    [self.circleLayer wobbleAnimation];
    [self.layer addSublayer:self.triangleLayer];
    [NSTimer scheduledTimerWithTimeInterval:0.9 target:self selector:@selector(showTriangleAnimation) userInfo:nil repeats:NO];
}

- (void)showTriangleAnimation
{
    [self.triangleLayer triangleAnimate];
    [NSTimer scheduledTimerWithTimeInterval:0.9 target:self selector:@selector(transformAnimation) userInfo:nil repeats:NO];
}

- (void)transformAnimation
{
    [self transformRotationZ];
    [self.circleLayer contract];
    [NSTimer scheduledTimerWithTimeInterval:0.4 target:self selector:@selector(drawRedRectangleAnimation) userInfo:nil repeats:NO];
}

- (void)drawRedRectangleAnimation
{
    [self.layer addSublayer:self.rectangleLayer];
    [self.rectangleLayer strokeChangeWithColor:[UIColor lj_colorWithHexString:@"da70d6"]];
    [NSTimer scheduledTimerWithTimeInterval:0.4 target:self selector:@selector(drawBlueRectangleAnimation) userInfo:nil repeats:NO];
}

- (void)drawBlueRectangleAnimation
{
    [self.rectangleLayer strokeChangeWithColor:[UIColor lj_colorWithHexString:@"40e0b0"]];
    [NSTimer scheduledTimerWithTimeInterval:0.4 target:self selector:@selector(drawWaveAnimation) userInfo:nil repeats:NO];
}

- (void)drawWaveAnimation
{
    [self.layer addSublayer:self.waveLayer];
    [self.waveLayer waveAnimate];
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(expandView) userInfo:nil repeats:NO];
}

- (void)expandView
{
    self.backgroundColor = [UIColor lj_colorWithHexString:@"40e0b0"];
    self.layer.sublayers = nil;
    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.frame = self.parentFrame;
    } completion:^(BOOL finished) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(completeAnimation)]) {
            [self.delegate completeAnimation];
        }
    }];
}

- (void)transformRotationZ
{
    self.layer.anchorPoint = CGPointMake(0.5, 0.65);
    CABasicAnimation * rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = @(M_PI * 2);
    rotationAnimation.duration = 0.3;
    rotationAnimation.removedOnCompletion = YES;
    [self.layer addAnimation:rotationAnimation forKey:nil];
}

@end
