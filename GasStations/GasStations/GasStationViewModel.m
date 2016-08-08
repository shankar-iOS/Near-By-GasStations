//
//  GasStationViewModel.m
//  NearByGasStations
//
//  Created by sivashankar on 02/10/16.
//  Copyright © 2016 shankar. All rights reserved.
//

#import "GasStationViewModel.h"
#import "CustomCell.h"
#import "GasStationManager.h"

@interface GasStationViewModel ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
}

@end

static NSString *cellIdentifier = @"cell";

@implementation GasStationViewModel


- (instancetype)initWithTableView:(UITableView *)tableView
                     sourceSignal:(NSArray *)source {
    
    if (self = [super init]) {
        _tableView = tableView;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        
        [[GasStationManager shareIServiceInstance] addGasSations:source completionHandler:^(NSArray *list) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [_tableView reloadData];
            });
            
        }];
    }
    return self;
}

+ (instancetype)HelperForTableView:(UITableView *)tableView
                      sourceSignal:(NSArray *)source {
    
    return [[GasStationViewModel alloc] initWithTableView:tableView
                                             sourceSignal:source];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger count = [[GasStationManager shareIServiceInstance] gasStationCount];
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    GasStation *data = [[GasStationManager shareIServiceInstance] getGasStationBySelectedIndex:indexPath.row];
    cell.lbltitle.text = data.title;
    cell.lblAddress.text = [NSString stringWithFormat:@"%@",data.city];
    //cell.lblDistance.text = [NSString stringWithFormat:@"%@mi",data.distance]; // I am just assuming it as mile
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([self.delegate respondsToSelector:@selector(didGasStationSelectIndex:)]) {
        [self.delegate didGasStationSelectIndex:indexPath];
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

@end
