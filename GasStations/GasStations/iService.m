//
//  iService.m
//  NearByGasStations
//
//  Created by sivashankar on 02/18/16.
//  Copyright © 2016 shankar. All rights reserved.
//


#import "iService.h"
#import "NSString+KeyString.h"

@implementation iService


 + (void)getJsonResponse : (NSString *)urlStr success : (void (^)(NSDictionary *responseDict))success failure:(void(^)(NSError* error))failure
{

    NSURLSession * session = [NSURLSession sharedSession];
    NSURL * url = [NSURL URLWithString: urlStr];
    
    // Asynchronously Api is hit here
    NSURLSessionDataTask * dataTask = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                                       {
                                           NSDictionary * json  = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                           success(json);
                                           
                                       }];
    
    [dataTask resume] ; // Executed First
    
}


+ (void) callToMobileNumber:(NSString *)number completionHandler:(void (^)(BOOL success))completion controller:(UIViewController *) controller{

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Call" message:@"Wanna call now?" preferredStyle:UIAlertControllerStyleActionSheet];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"Call Now" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        NSString *phoneURLString = [[NSString stringWithFormat:@"tel:%@", number] removeWhiteSpace];
        NSURL *phoneURL = [NSURL URLWithString:phoneURLString];
        
        if([[UIApplication sharedApplication] canOpenURL:phoneURL]) {
            [[UIApplication sharedApplication] openURL:phoneURL];
            completion(YES);
        }
        else {
            //Show error message to user, etc.
            completion(NO);
        }
        
    }]];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        
    }]];
    
    [controller presentViewController:alertController animated:YES completion:nil];

}

@end
