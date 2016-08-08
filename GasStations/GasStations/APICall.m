//
//  APICall.m
//  NearByGasStations
//
//  Created by sivashankar on 02/10/16.
//  Copyright © 2016 shankar. All rights reserved.
//


#import "APICall.h"
#import "iService.h"
#import <CoreLocation/CoreLocation.h>

#define BaseAPI @"https://maps.googleapis.com/maps/api/place/nearbysearch/json?key="
#define Key @"AIzaSyACQGbsg3WqEjBXk2GYnBdAiDYYGEaTgOU&sensor"
#define Type @"gas_station"


@implementation APICall


+ (void)loadNearByGasStation:(CLLocation*)location gasSations: (void (^)(NSArray *responseDict))response{
   
    if (!location) {
        response(nil);
        return;
    }

    NSString *api = [NSString stringWithFormat:@"%@%@&sensor=false&location=%f,%f&radius=1500&keyword=%@",BaseAPI,Key,location.coordinate.latitude,location.coordinate.longitude,Type];

    NSString *encodedString =[api stringByAddingPercentEncodingWithAllowedCharacters:NSCharacterSet.URLQueryAllowedCharacterSet];
    
    [iService getJsonResponse:encodedString success:^(NSDictionary *responseDict) {
        // success block
        response([responseDict valueForKeyPath:@"results"]);

    } failure:^(NSError *error) {
        // This is failure block
        
    }];
    
}


@end
