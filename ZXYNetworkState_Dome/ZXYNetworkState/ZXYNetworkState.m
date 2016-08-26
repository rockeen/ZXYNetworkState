//
//  ZXYNetworkState.m
//  ZXYNetworkState_Dome
//
//  Created by Rockeen on 16/8/25.
//  Copyright © 2016年 rockeen. All rights reserved.
//

#import "ZXYNetworkState.h"
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>


@implementation ZXYNetworkState{

    Reachability *_reachability;


}

/**
 *  返回网络状态
 *
 *  @return 2G,Edge,3G,4G可用和wifi
 */
+ (ZXYNetworkStatus)zxy_state{


    //wifi是否可用
    if ([[Reachability reachabilityForLocalWiFi] currentReachabilityStatus]==ReachableViaWiFi) {
        
        return ZXYNetWorkStateWifi;
    }
    //蜂窝数据是否可用
    else if ([[Reachability reachabilityForInternetConnection] currentReachabilityStatus]==ReachableViaWWAN){
       return  [self carrierStatus];
    
    }
    //无网络
    else
        
        return ZXYNetWorkStateNotReachable;
}

/**
 *  运营商网络状态
 *
 *  @return 网络状态
 */
+ (ZXYNetworkStatus)carrierStatus
{
    CTTelephonyNetworkInfo *info=[CTTelephonyNetworkInfo new];
    NSString *status=info.currentRadioAccessTechnology;
    
    if([status isEqualToString:CTRadioAccessTechnologyCDMA1x]||[status isEqualToString:CTRadioAccessTechnologyGPRS])
        return ZXYNetWorkState2G;
    else if([status isEqualToString:CTRadioAccessTechnologyEdge])
        return ZXYNetWorkStateEdge;
    else if([status isEqualToString:CTRadioAccessTechnologyLTE])
        return ZXYNetWorkState4G;
    else
        return ZXYNetWorkState3G;
}



@end
