//
//  AnimationView.h
//  Test
//
//  Created by LiuFeifei on 16/6/22.
//  Copyright © 2016年 LiuJie. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AnimatiomViewDelegate <NSObject>

- (void)completeAnimation;

@end

@interface AnimationView : UIView

@property (nonatomic, assign) CGRect parentFrame;
@property (weak, nonatomic) id<AnimatiomViewDelegate>delegate;

@end
