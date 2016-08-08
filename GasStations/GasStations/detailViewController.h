//
//  detailViewController.h
//  NearByGasStations
//
//  Created by sivashankar on 02/06/16.
//  Copyright © 2016 shankar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GasStation.h"

@interface detailViewController : UIViewController

@property (nonatomic, strong) GasStation *gasStationDetail;

@property (weak, nonatomic) IBOutlet UILabel *txtTitle;

@property (weak, nonatomic) IBOutlet UILabel *txtAddress;

- (IBAction)directionNow:(id)sender;

@end
