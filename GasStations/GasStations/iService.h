//
//  iService.h
//  NearByGasStations
//
//  Created by sivashankar on 02/18/16.
//  Copyright © 2016 shankar. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface iService : NSObject

 + (void)getJsonResponse : (NSString *)urlStr success : (void (^)(NSDictionary *responseDict))success failure:(void(^)(NSError* error))failure;

 + (void) callToMobileNumber:(NSString *)number completionHandler:(void (^)(BOOL success))completion controller:(UIViewController *) controller;

@end
