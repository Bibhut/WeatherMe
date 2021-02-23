//
//  WMNetworking.h
//  WeatherMe
//
//  Created by Bibhut Bikram Thakuri on 21/2/2021.
//

#import <Foundation/Foundation.h>

typedef void (^completionHandler)(BOOL status, NSDictionary *responseData);

@interface WMNetworking:NSObject
+ (WMNetworking *)sharedManager;
-(void) GetRequest:(NSString *) stringURL andParameter:(NSDictionary *) parameter withCompletionBlock:(completionHandler)responseHandler;
@end
