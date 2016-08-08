//
//  GPSService.h
//  NearByGasStations
//
//  Created by sivashankar on 02/18/16.
//  Copyright © 2016 shankar. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>


@protocol GPSServiceDelegate <NSObject>

-(void)didSendPlaceMark:(CLPlacemark *)placemark;

@end

@interface GPSService : NSObject

+ (GPSService *)shareGPSService;

@property (nonatomic, strong) CLLocationManager* locationManager;

@property (nonatomic, strong) NSString *postCode;

@property (nonatomic, strong) NSString *city;

@property (nonatomic, strong) NSString *street;

@property (nonatomic, strong) NSString *state;

@property (weak, nonatomic) id <GPSServiceDelegate> delegate;

-(NSString*) caliculateDistance:(double)latitude andLong:(double)longitude;
@end
