//
//  Global.m
//  WeatherMe
//
//  Created by Bibhut Bikram Thakuri on 21/2/2021.
//

#import <Foundation/Foundation.h>
#import "Global.h"




@implementation Global


+ (NSDate *)getDateFromTimeStamp:(NSString*)timeStamp{
    NSTimeInterval unixTimeStamp = [timeStamp doubleValue];
    NSDate *exactDate = [NSDate dateWithTimeIntervalSince1970:unixTimeStamp];
    return exactDate;
}

+ (NSString *)getStringFromDate:(NSDate *)date withFormat:(NSString *)formatString
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];

    [dateFormatter setDateFormat:formatString];
    NSString *dateString = [dateFormatter stringFromDate:date];
    return dateString;
}


+ (NSString *)getDateFromNsNumber:(NSNumber *)date {
    NSDate *nsDate = [self getDateFromTimeStamp:[date stringValue]];
    NSString *strDate = [self getStringFromDate:nsDate withFormat:@"EEEE, MMM d, yyyy"];
    return [NSString stringWithFormat:@"%@",strDate];
}

+ (NSString *)getCelciusFromKelvin:(NSNumber *)kelvinValue {
    float centigrade = [kelvinValue floatValue] - 273.15;
   return [NSString stringWithFormat:@"%.1f°C", centigrade];
}



@end


