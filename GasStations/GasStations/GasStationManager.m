//
//  GasStationManager.m
//  NearByGasStations
//
//  Created by sivashankar on 02/14/16.
//  Copyright © 2016 shankar. All rights reserved.
//

#import "GasStationManager.h"
#import "GasStation.h"
#import <CoreLocation/CoreLocation.h>


@implementation GasStationManager

+ (GasStationManager *)shareIServiceInstance {
    
    static GasStationManager *shareInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance =[[GasStationManager alloc] init];
    });
    
    return shareInstance;
}

// create pizzas list
-(void)addGasSations:(NSArray *)list completionHandler:(void (^)(NSArray *list))completion{
    
    self.gasStationList = [[NSMutableArray alloc] init];
    
    [list enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        GasStation *gasStation = [GasStation new];
        
        [gasStation setTitle:[obj valueForKey:@"name"]];
        [gasStation setCity:[obj valueForKey:@"vicinity"]];
        //Location
        NSDictionary *geo = [obj objectForKey:@"geometry"];
        NSDictionary *loc = [geo objectForKey:@"location"];
        [gasStation setLathitude:
         [NSString stringWithFormat:@"%f",[[loc objectForKey:@"lat"] doubleValue]]];
        [gasStation setLongitude:
         [NSString stringWithFormat:@"%f",[[loc objectForKey:@"lng"] doubleValue]]];
       
        /*To caliculate of Distance
       // [gasStation setDistance:[[GPSService shareGPSService] caliculateDistance:[[loc objectForKey:@"lat"] doubleValue] andLong:[[loc objectForKey:@"lng"] doubleValue]]];
        */
        
        [self.gasStationList addObject:gasStation];
    }];

    completion(list);
    
}


//@return total number of pizza
-(NSInteger) gasStationCount {
    return [self.gasStationList count];
}

// @return pizza by selected index
-(GasStation *)getGasStationBySelectedIndex:(NSInteger)indexpath {
    return [self.gasStationList objectAtIndex:indexpath];
}


@end
