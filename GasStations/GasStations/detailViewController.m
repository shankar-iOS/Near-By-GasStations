//
//  detailViewController.m
//  NearByGasStations
//
//  Created by sivashankar on 02/06/16.
//  Copyright © 2016 shankar. All rights reserved.
//

#import "detailViewController.h"
#import "iService.h"

@interface detailViewController ()

@end

@implementation detailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.txtTitle.text = self.gasStationDetail.title;
    self.txtAddress.text = [NSString stringWithFormat:@"%@",self.gasStationDetail.city];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)directionNow:(id)sender {
    
    if ([[UIApplication sharedApplication] canOpenURL:
         [NSURL URLWithString:@"comgooglemaps://"]]) {
        [[UIApplication sharedApplication] openURL:
         [NSURL URLWithString:[NSString stringWithFormat:@"comgooglemaps://?q=gas_station&center=%@,%@&zoom=14&views=traffic",self.gasStationDetail.lathitude,self.gasStationDetail.longitude]]];
    } else {
        NSLog(@"Can't use comgooglemaps://");
    }
    
}
@end
