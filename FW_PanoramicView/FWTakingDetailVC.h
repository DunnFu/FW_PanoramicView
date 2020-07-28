//
//  FWTakingDetailVC.h
//  GrainAPP
//
//  Created by fuwu on 2018/11/26.
//  Copyright © 2018年 GJG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>


#define KINT_HIGHT_INTERVAL_BUTTON  54

typedef enum : int {
    NoneInertia = 0,
    ShortInertia,
    LongInertia
} enumInertia;

@protocol FWTakingDetailVCDelegate <NSObject>


@end

@interface FWTakingDetailVC : UIViewController

@property (nonatomic, strong) UIImageView *motionImgV;


- (void)getObjectimgData:(NSMutableData *)imgData;

@end
