//
//  WeatherService.h
//  WeatherMe
//
//  Created by Bibhut Bikram Thakuri on 21/2/2021.
//
#import <Foundation/Foundation.h>
#import "Location.h"

typedef void (^weatherDataCompletionHandler)(BOOL status, Location *locationWeatherData);


@interface WeatherService : NSObject

+ (void)getCurrentWeatherDataFromCity:(NSString *)cityName handler:(weatherDataCompletionHandler)onComplete;
@end
