//
//  Weather.h
//  WeatherMe
//
//  Created by Bibhut Bikram Thakuri on 21/2/2021.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

@interface Weather : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSString *main;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *icon;

@end
