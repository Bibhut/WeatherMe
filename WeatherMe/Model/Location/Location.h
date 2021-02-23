//
//  Location.h
//  WeatherMe
//
//  Created by Bibhut Bikram Thakuri on 21/2/2021.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>
#import "Weather.h"
#import "Main.h"


@interface Location : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *currentDate;
@property (nonatomic, strong) NSNumber *visibility;
@property (nonatomic, assign) NSArray *weather;
@property (nonatomic, assign) Main *main;

@end
