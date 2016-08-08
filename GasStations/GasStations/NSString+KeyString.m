//
//  NSString+KeyString.m
//  NearByGasStations
//
//  Created by sivashankar on 02/08/16.
//  Copyright © 2016 shankar. All rights reserved.
//

#import "NSString+KeyString.h"

@implementation NSString (KeyString)

-(NSString *)removeWhiteSpace {
    return  [self stringByReplacingOccurrencesOfString:@" " withString:@""];
}
@end
