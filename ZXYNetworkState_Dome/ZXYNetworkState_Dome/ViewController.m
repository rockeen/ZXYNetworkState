//
//  ViewController.m
//  ZXYNetworkState_Dome
//
//  Created by Rockeen on 16/8/24.
//  Copyright © 2016年 rockeen. All rights reserved.
//

#import "ViewController.h"
#import "ZXYNetworkState.h"

@interface ViewController ()

@end

@implementation ViewController{

    Reachability *_reachability;


}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    
    _reachability=[Reachability reachabilityForInternetConnection];
    //网络状态改变时调用estimateNetwork方法
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(estimateNetwork) name:kReachabilityChangedNotification object:nil];
    [_reachability startNotifier];
    
    //判断网络状态
    [self estimateNetwork];
    

}



//判断网络状态
-(void)estimateNetwork
{
    
    NSInteger status=[ZXYNetworkState zxy_state];
    switch (status) {
            
            
        case 1:
        {
            NSLog(@"当前网络状态2G");
            [self showAlertWithString:@"当前网络状态2G"];
            break;
        }
        case 2:
        {
            NSLog(@"当前网络状态2.75G(Edge)");
            [self showAlertWithString:@"当前网络状态2.75G(Edge)"];
            break;
        }
        case 3:
        {
            NSLog(@"当前网络状态3G");
            [self showAlertWithString:@"当前网络状态3G"];
            break;
        }
        case 4:
        {
            NSLog(@"当前网络状态4G");
            [self showAlertWithString:@"当前网络状态4G"];
            break;
        }
        case 5:
        {
            NSLog(@"当前网络状态wifi");
            [self showAlertWithString:@"当前网络状态wifi"];
            break;
        }
        case 0:
        {
            NSLog(@"当前网络状态不可用");
            [self showAlertWithString:@"当前网络状态不可用"];
            break;
        }
        default:
            break;
    }
}
//显示警告视图
-(void)showAlertWithString:(NSString *)str
{
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提示" message:str delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
    [self performSelector:@selector(dismissAlert:) withObject:alert afterDelay:ZXYAlertViewDuration];
}
//移除警告视图
-(void)dismissAlert:(UIAlertView *)alert
{
    [alert dismissWithClickedButtonIndex:0 animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//停止网络状态监听，移除通知
-(void)dealloc
{
    [_reachability stopNotifier];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kReachabilityChangedNotification object:nil];
}

@end
