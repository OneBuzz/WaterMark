//
//  ViewController.m
//  WaterMark
//
//  Created by BuzzLightYear23 on 16/2/29.
//  Copyright © 2016年 Irving. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //加载图片
    UIImage *image = [UIImage imageNamed:@"me"];
    
    //开启一个位图上下文
    //size:位图上下文的尺寸（新图片的尺寸）
    //opaque:不透明度 YES:不透明 NO：透明 ，一般我们都弄透明上下文
    //scale:通常不需要缩放上下文，取值为0，表示为不缩放
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    
    //绘制原生的图片
    [image drawAtPoint:CGPointZero];
    
    //给原生的图片添加文字
    NSString *str = @"@BuzzLightYear23";
    
    //创建字典属性
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor whiteColor];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    
    [str drawAtPoint:CGPointMake(170, 280) withAttributes:dict];
    
    //生成一张图片给我们，从上下文中获取图片
    UIImage *imageWater = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭上下文
    UIGraphicsEndImageContext();
    
    _imageView.image = imageWater;


}


@end
