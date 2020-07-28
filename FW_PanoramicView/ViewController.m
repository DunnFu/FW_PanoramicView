//
//  ViewController.m
//  FW_PanoramicView
//
//  Created by xpchina001 on 2020/7/28.
//  Copyright © 2020 FUWU. All rights reserved.
//

#import "ViewController.h"
#import "FWTakingDetailVC.h"

@interface ViewController ()
@property (nonatomic, strong) NSMutableData *datas;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
      UIImage *prImage = [UIImage imageNamed:@"panoramic.jpg"];
       NSData *img = UIImagePNGRepresentation(prImage);//UIImageJPEGRepresentation(fwImgs,1);
    _datas = img.mutableCopy;
}
- (IBAction)seePRImageAction:(UIButton *)sender {
    
    FWTakingDetailVC *detailVC = [[FWTakingDetailVC alloc] init];
    
    [self.navigationController pushViewController:detailVC animated:YES];
    
    [detailVC getObjectimgData:_datas];
    
}


@end
