//
//  GasStation.h
//  NearByGasStations
//
//  Created by sivashankar on 02/10/16.
//  Copyright © 2016 shankar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GasStation : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *state;
@property (nonatomic, strong) NSString *distance;
@property (nonatomic, strong) NSString *lathitude;
@property (nonatomic, strong) NSString *longitude;

@end
