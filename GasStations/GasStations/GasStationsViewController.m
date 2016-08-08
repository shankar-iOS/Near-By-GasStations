//
//  GasStationsViewController.m
//  NearByGasStations
//
//  Created by sivashankar on 02/06/16.
//  Copyright © 2016 shankar. All rights reserved.
//

#import "GasStationsViewController.h"
#import "GasStationViewModel.h"
#import "GPSService.h"
#import "GasStationManager.h"
#import "detailViewController.h"

#import "APICall.h"
@interface GasStationsViewController ()<GPSServiceDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) GasStationViewModel *gasStationModelVIew;
@end

@implementation GasStationsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadGasStations];
}


-(void)loadGasStations {

    GPSService *gps = [GPSService shareGPSService];
    gps.delegate = self;
    
}


#pragma mark - GPSServiceDelegate

-(void)didSendPlaceMark:(CLPlacemark *)placemark {
    [APICall loadNearByGasStation:placemark.location gasSations:^(NSArray *gasStations){
        
        self.gasStationModelVIew = [[GasStationViewModel alloc] initWithTableView:self.tableView sourceSignal:gasStations];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    detailViewController *detailView = [segue destinationViewController];
    [detailView setGasStationDetail:[[GasStationManager shareIServiceInstance] getGasStationBySelectedIndex:[[self.tableView indexPathForSelectedRow] row]]];
    
}


@end
