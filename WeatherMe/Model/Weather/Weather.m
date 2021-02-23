//
//  Weather.m
//  WeatherMe
//
//  Created by Bibhut Bikram Thakuri on 21/2/2021.
//

#import <Foundation/Foundation.h>
#import "Weather.h"

@implementation Weather

+ (NSDictionary*)JSONKeyPathsByPropertyKey {
    return @{
             @"main" : @"main",
             @"desc" : @"description",
             @"icon" : @"icon",
             };
}

+ (NSValueTransformer *)contentJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:[Weather class]];
}

@end

