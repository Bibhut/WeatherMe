//
//  Main.m
//  WeatherMe
//
//  Created by Bibhut Bikram Thakuri on 21/2/2021.
//

#import <Foundation/Foundation.h>
#import "Main.h"

@implementation Main

+ (NSDictionary*)JSONKeyPathsByPropertyKey {
  return @{
    @"avgTemp" : @"temp",
    @"humidity": @"humidity",
    @"tempMin" : @"temp_min",
    @"tempMax": @"temp_max",
  };
}

+ (NSValueTransformer *)contentJSONTransformer {
  return [MTLJSONAdapter dictionaryTransformerWithModelClass:[Main class]];
}

@end
