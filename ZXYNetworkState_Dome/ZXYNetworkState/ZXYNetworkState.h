//
//  ZXYNetworkState.h
//  ZXYNetworkState_Dome
//
//  Created by Rockeen on 16/8/25.
//  Copyright © 2016年 rockeen. All rights reserved.
//

/*
 ----------------------------------------------------
 ZXYNetworkState用法简介：
 1.导入CoreTelephony.framework框架
 2.导入#import "ZXYNetworkState"头文件
 3.获取当前网络状态：ZXYNetworkStatus status=[ZXYNetworkState zxy_state];
 4.作出判断
 ==>若status==ZXYNetWorkState2G，则当前网络状态为2G；
 ==>若status==ZXYNetWorkStateEdge，则当前网络状态为2.75G(Edge)；
 ==>若status==ZXYNetWorkState3G，则当前网络状态为3G；
 ==>若status==ZXYNetWorkState4G，则当前网络状态为4G；
 ==>若status==ZXYNetWorkStateWifi，则当前网络状态为wifi；
 ==>若status==ZXYNetWorkStateNotReachable，则当前网络状态为不可用；
 ---------------------------------------------------
 */

#import <Foundation/Foundation.h>
#import "Reachability/Reachability.h"

//提示视图在持续3秒后消失
#define ZXYAlertViewDuration 3

//网络状态
typedef enum{

    ZXYNetWorkStateNotReachable=0,
    ZXYNetWorkState2G,
    ZXYNetWorkStateEdge,
    ZXYNetWorkState3G,
    ZXYNetWorkState4G,
    ZXYNetWorkStateWifi,

} ZXYNetworkStatus;

@interface ZXYNetworkState : NSObject

//提示消失时间
@property (nonatomic, assign)NSInteger  delayTime;



/**
 *  获取网络状态
 *
 *  @return 网络状态
 */
+ (ZXYNetworkStatus)zxy_state;

@end
