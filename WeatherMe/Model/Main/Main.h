//
//  Main.h
//  WeatherMe
//
//  Created by Bibhut Bikram Thakuri on 21/2/2021.
//
#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

@interface Main : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSNumber *avgTemp;
@property (nonatomic, strong) NSNumber *tempMax;
@property (nonatomic, strong) NSNumber *tempMin;
@property (nonatomic, strong) NSNumber *humidity;

@end
