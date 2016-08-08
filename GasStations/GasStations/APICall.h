//
//  APICall.h
//  NearByGasStations
//
//  Created by sivashankar on 02/10/16.
//  Copyright © 2016 shankar. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface APICall : NSObject

+ (void)loadNearByGasStation:(CLLocation*)postCode gasSations: (void (^)(NSArray *responseDict))response;

@end
