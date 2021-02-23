//
//  Location.m
//  WeatherMe
//
//  Created by Bibhut Bikram Thakuri on 21/2/2021.
//
#import <Foundation/Foundation.h>
#import "Location.h"

@implementation Location

+ (NSDictionary*)JSONKeyPathsByPropertyKey
{
    return @{
        @"name" : @"name",
        @"weather" : @"weather",
        @"main" : @"main",
        @"currentDate": @"dt",
        @"visibility" : @"visibility",
    };
}

+ (NSValueTransformer *)contentJSONTransformer
{
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[Location class]];
}

+ (NSValueTransformer *)mainJSONTransformer
{
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[Main class]];
}

+ (NSValueTransformer *)weatherJSONTransformer
{
    return [MTLJSONAdapter arrayTransformerWithModelClass:[Weather class]];
}






@end
