//
//  WeatherService.h
//  WeatherMe
//
//  Created by Bibhut Bikram Thakuri on 21/2/2021.
//
#import <Foundation/Foundation.h>
#import "Location.h"

typedef void (^weatherDataCompletionHandler)(Location *locationWeatherData);
typedef void (^failureHandler)(NSString* message);


@interface WeatherService : NSObject
+ (void)getCurrentWeatherDataFromCity:(NSString *)cityName handler:(weatherDataCompletionHandler)onComplete onFailureHandler:(failureHandler)onComplete;
@end
