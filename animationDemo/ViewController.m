//
//  ViewController.m
//  animationDemo
//
//  Created by Harute on 2017/8/2.
//  Copyright © 2017年 Harute. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *BackGroundImg;
@property (weak, nonatomic) IBOutlet UIImageView *BackGroundImgNext;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_BackGroundImg setImage:[UIImage imageNamed:@"animationBackGround"]];
    [_BackGroundImg setFrame:[UIScreen mainScreen].bounds];

    [_BackGroundImgNext setImage:[UIImage imageNamed:@"animationBackGround"]];
    [_BackGroundImgNext setFrame:CGRectMake([UIScreen mainScreen].bounds.size.width, _BackGroundImg.frame.origin.y, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    

}


- (void)viewDidAppear:(BOOL)animated{
    NSLog(@"ViewDidAppear!!!");
    
    /*
     *设置远景动画
    */
    CABasicAnimation *BackGroundanimation = [CABasicAnimation animationWithKeyPath:@"position"];// 指定position属性
    BackGroundanimation.duration = 4; // 动画持续时间
    BackGroundanimation.repeatCount = HUGE_VALF; // 无限循环
    BackGroundanimation.beginTime = CACurrentMediaTime();
    BackGroundanimation.autoreverses = NO; // 结束后不执行逆动画

    // 设定动画起始帧和结束帧
    BackGroundanimation.fromValue = [NSValue valueWithCGPoint:_BackGroundImg.layer.position]; // 起始点
    BackGroundanimation.toValue = [NSValue valueWithCGPoint:CGPointMake(-[UIScreen mainScreen].bounds.size.width/2, self.view.center.y)]; // 终了点
    [_BackGroundImg.layer addAnimation:BackGroundanimation forKey:@"move-layer"];
    
    CABasicAnimation *BackGroundanimationNext = [CABasicAnimation animationWithKeyPath:@"position"];
    BackGroundanimationNext.duration = 4; // 动画持续时间
    BackGroundanimationNext.repeatCount = HUGE_VALF; // 无限循环
    BackGroundanimationNext.beginTime = CACurrentMediaTime();
    BackGroundanimationNext.autoreverses = NO; // 结束后不执行逆动画

    // 设定动画起始帧和结束帧
    BackGroundanimationNext.fromValue = [NSValue valueWithCGPoint:CGPointMake(self.view.center.x+[UIScreen mainScreen].bounds.size.width,self.view.center.y)]; // 起始点
    BackGroundanimationNext.toValue = [NSValue valueWithCGPoint:CGPointMake(self.view.center.x, self.view.center.y)]; // 终了点
    [_BackGroundImgNext.layer addAnimation:BackGroundanimationNext forKey:@"move-layer2"];
    
    
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
