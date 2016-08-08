//
//  GasStationViewModel.h
//  NearByGasStations
//
//  Created by sivashankar on 02/10/16.
//  Copyright © 2016 shankar. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GasStationViewProtocolDelegate <NSObject>

-(void)didGasStationSelectIndex:(NSIndexPath *)indexpath;

@end

@interface GasStationViewModel : NSObject

- (instancetype)initWithTableView:(UITableView *)tableView
                     sourceSignal:(NSArray *)source;

+ (instancetype)HelperForTableView:(UITableView *)tableView
                      sourceSignal:(NSArray *)source;

@property (weak, nonatomic)id <GasStationViewProtocolDelegate> delegate;

@end

