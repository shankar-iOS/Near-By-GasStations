//
//  GasStationManager.h
//  NearByGasStations
//
//  Created by sivashankar on 02/14/16.
//  Copyright © 2016 shankar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GasStation.h"
#import "GPSService.h"

@interface GasStationManager : NSObject

@property (nonatomic, strong) NSMutableArray *gasStationList;

-(void)addGasSations:(NSArray *)list completionHandler:(void (^)(NSArray *list))completion;

+ (GasStationManager *) shareIServiceInstance;

-(NSInteger) gasStationCount ;

// @return pizza by selected index
-(GasStation *)getGasStationBySelectedIndex:(NSInteger)indexpath;
@end
