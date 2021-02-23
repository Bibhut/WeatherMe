//
//  WeatherService.m
//  WeatherMe
//
//  Created by Bibhut Bikram Thakuri on 21/2/2021.
//

#import <Foundation/Foundation.h>
#import "WeatherService.h"
#import "WMNetworking.h"
#import "Location.h"
#import "WebserviceConstants.h"
#import "Constants.h"


@implementation WeatherService

//Webservice to get the weather detail from city name.

+ (void)getCurrentWeatherDataFromCity:(NSString *)cityName handler:(weatherDataCompletionHandler)onComplete onFailureHandler:(failureHandler)onFail{
    
    //url to get weather detail
    NSString *weatherURL = [NSString stringWithFormat:(@"%@%@&appid=%@"),kBASEURL,cityName,kWeatherAPIKey];
    [[WMNetworking sharedManager] GetRequest:weatherURL andParameter:nil withCompletionBlock:^(BOOL status, NSDictionary *responseData) {
        if (status) {
            NSError *error;
            Location *location = [MTLJSONAdapter modelOfClass:[Location class] fromJSONDictionary:responseData error:&error];
            onComplete(location);
            return;
        } else {
            NSString *errorMsg = [responseData objectForKey:@"message"];
            onFail(errorMsg);
        }
    }];
}

@end
