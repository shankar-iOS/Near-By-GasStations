
//
//  GPSService.m
//  NearByGasStations
//
//  Created by sivashankar on 02/18/16.
//  Copyright © 2016 shankar. All rights reserved.
//


#import "GPSService.h"
@interface GPSService()<CLLocationManagerDelegate>



@end

@implementation GPSService

+(GPSService *)shareGPSService {
    
    static GPSService *shareInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance =[[GPSService alloc] init];
    });
    
    return shareInstance;
}

// Initializing location service

-(id) init {
    self = [super init];
    if(self) {
    self.locationManager = [CLLocationManager new];
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationManager.delegate = self;
    if([self.locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]){
        NSUInteger code = [CLLocationManager authorizationStatus];
        if (code == kCLAuthorizationStatusNotDetermined && ([self.locationManager respondsToSelector:@selector(requestAlwaysAuthorization)] || [self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)])) {
            // choose one request according to your business.
            if([[NSBundle mainBundle] objectForInfoDictionaryKey:@"NSLocationAlwaysUsageDescription"]){
                [self.locationManager requestAlwaysAuthorization];
            } else if([[NSBundle mainBundle] objectForInfoDictionaryKey:@"NSLocationWhenInUseUsageDescription"]) {
                [self.locationManager  requestWhenInUseAuthorization];
            } else {
                NSLog(@"Info.plist does not contain NSLocationAlwaysUsageDescription or NSLocationWhenInUseUsageDescription");
            }
        }
    }
    [self.locationManager startUpdatingLocation];
    }
    return self;
}


-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {

    [self getlocationByCoordinateCompletion];
    // Stop location service
    [self.locationManager stopUpdatingLocation];
}


// added a block for future use. its not necessary now
- (void)getlocationByCoordinateCompletion  {

    CLLocationCoordinate2D coordinate = self.locationManager.location.coordinate;
    CLGeocoder *geoCoder = [[CLGeocoder alloc] init];
    
    [geoCoder reverseGeocodeLocation: [[CLLocation alloc]initWithLatitude:coordinate.latitude longitude:coordinate.longitude]completionHandler: ^(NSArray *placemarks, NSError *error) {
        
        if (error) {
            NSLog(@"Error %@", error.description);
        } else {
            
            NSLog(@"lat&long %f,%f", coordinate.latitude,coordinate.longitude);

            
            CLPlacemark *placemark = [placemarks lastObject];
            
            if ([self.delegate respondsToSelector:@selector(didSendPlaceMark:)]) {
                [self.delegate didSendPlaceMark:placemark];
            }
                    
        }
        
    }];
}

-(NSString*) caliculateDistance:(double)latitude andLong:(double)longitude{
    
    
    CLLocation *newLocation = [[CLLocation alloc] initWithLatitude:latitude longitude:longitude];
    
    CLLocationDistance distanceInMeters = [self.locationManager.location distanceFromLocation:newLocation];
    NSLog(@"distance %@",[NSString stringWithFormat:@"%f",distanceInMeters/1609.344]);
    
    return [NSString stringWithFormat:@"%.2f",distanceInMeters/1609.344];
}



@end
