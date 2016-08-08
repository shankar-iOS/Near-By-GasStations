//
//  GasStation.m
//  NearByGasStations
//
//  Created by sivashankar on 02/10/16.
//  Copyright © 2016 shankar. All rights reserved.
//

#import "GasStation.h"
#import "iService.h"

@implementation GasStation

+ (iService *)shareIServiceInstance {
    
    static iService *shareInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance =[[iService alloc] init];
    });
    
    return shareInstance;
}

@end
