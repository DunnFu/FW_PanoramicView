//
//  FWTakingDetailVC.m
//  GrainAPP
//
//  Created by fuwu on 2018/11/26.
//  Copyright © 2018年 GJG. All rights reserved.
//

#import "FWTakingDetailVC.h"
#import "SphereXmp.h"
#import "GlkViewController.h"

@interface FWTakingDetailVC ()
{
 
    NSMutableData *_imageData;

    GlkViewController *glkViewController;

    int imageWidth;
    int imageHeight;
    
    float _yaw;
    float _roll;
    float _pitch;
    
}
@property (nonatomic, strong) UIButton *titleBtn;
@property (strong, nonatomic) UIActivityIndicatorView *activityIndicator ;
@end

@implementation FWTakingDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor =[UIColor whiteColor];
    self.activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
       [self.view addSubview:self.activityIndicator];
       self.activityIndicator.frame= CGRectMake(100, 200, 100, 100);
       self.activityIndicator.color = [UIColor redColor];
       self.activityIndicator.backgroundColor = [UIColor cyanColor];
       self.activityIndicator.hidesWhenStopped = NO;
    
     [self.activityIndicator startAnimating];
    
    self.navigationController.navigationBar.hidden = YES;
    
    [self setNat];
    [self addAllViews];
}

- (void)setNat {
    self.view.backgroundColor = [UIColor clearColor];
    
  
}

- (void)viewWillDisappear:(BOOL)animated {
  
    [super viewWillDisappear:animated];
}
- (void)viewWillAppear:(BOOL)animated {
    
    
    [super viewWillAppear:animated];
    
}
- (void)addAllViews {
    
    self.motionImgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,  [UIScreen mainScreen].bounds.size.height)];
    
    [self.view addSubview:self.motionImgV];
    
}
#pragma mark - HTTP Operation

- (void)getObjectimgData:(NSMutableData *)imgData
{
     
    _imageData = imgData;
    SphereXmp *xmp = [[SphereXmp alloc] init];
    [xmp parse:_imageData];
    
    // If there is no information, yaw, pitch and roll method returns NaN.
    NSString* tiltInfo = [NSString stringWithFormat:@"yaw:%@ pitch:%@ roll:%@",
                          xmp.yaw, xmp.pitch, xmp.roll];
    //NSLog(@"======%@",tiltInfo);
    _yaw = [xmp.yaw floatValue];     // 0.0 if conversion fails
    _pitch = [xmp.pitch floatValue]; // 0.0 if conversion fails
    _roll = [xmp.roll floatValue];   // 0.0 if conversion fails
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.activityIndicator stopAnimating];
        [self startGLK];
    });
}

#pragma mark - Life cycle




#pragma make - operation

- (void)startGLK
{
    glkViewController = [[GlkViewController alloc] init: self.motionImgV.frame image:_imageData width:imageWidth height:imageHeight yaw:_yaw roll:_roll pitch:_pitch];
    glkViewController.view.frame =  self.motionImgV.frame;
    
    
    
    NSLog(@"startGLK: frame %f %f %f %f",  self.motionImgV.frame.origin.x,  self.motionImgV.frame.origin.y,  self.motionImgV.frame.size.width,  self.motionImgV.frame.size.height);
    
    [self.view addSubview:glkViewController.view];
    

    
    [self addChildViewController:glkViewController];
    [glkViewController didMoveToParentViewController:self];
}

@end
