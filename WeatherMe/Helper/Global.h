//
//  Global.h
//  WeatherMe
//
//  Created by Bibhut Bikram Thakuri on 21/2/2021.
//



@interface Global : NSObject
+ (NSDate *)getDateFromTimeStamp:(NSString*)timeStamp;
+ (NSString *)getStringFromDate:(NSDate *)date withFormat:(NSString *)formatString;
+ (NSString *)getDateFromNsNumber:(NSNumber *)date;
+ (NSString *)getCelciusFromKelvin:(NSNumber *)kelvinValue ;
@end
