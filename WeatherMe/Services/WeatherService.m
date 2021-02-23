//
//  WeatherService.m
//  WeatherMe
//
//  Created by Bibhut Bikram Thakuri on 21/2/2021.
//

#import <Foundation/Foundation.h>
#import "WeatherService.h"
#import "WMNetworking.h"
#import "WebserviceConstants.h"
#import "Location.h"


@implementation WeatherService



+ (void)getCurrentWeatherDataFromCity:(NSString *)cityName handler:(weatherDataCompletionHandler)onComplete{
  [[WMNetworking sharedManager] GetRequest:cityName andParameter:nil withCompletionBlock:^(BOOL status, NSDictionary *responseData) {
    if (status) {
      NSError *error;
      Location *location = [MTLJSONAdapter modelOfClass:[Location class] fromJSONDictionary:responseData error:&error];
      onComplete(status,location);
      return;
    } else {
      onComplete(NO,nil);
    }
  }];
}



@end
