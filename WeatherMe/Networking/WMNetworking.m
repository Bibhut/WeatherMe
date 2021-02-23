//
//  WMNetworking.m
//  WeatherMe
//
//  Created by Bibhut Bikram Thakuri on 21/2/2021.
//

#import <Foundation/Foundation.h>
//
//  Network.m
//  iAcquaint
//
//  Created by Hem Poudyal on 7/26/18.
//  Copyright © 2018 zco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WMNetworking.h"
#import "AFNetworking.h"
#import "WebserviceConstants.h"
#import "Constants.h"

@implementation WMNetworking

// Get singleton instance of this class.
+ (WMNetworking *)sharedManager
{
static dispatch_once_t once;
static WMNetworking * sharedInstance;
dispatch_once(&once, ^{
   sharedInstance = [[self alloc] init];
});
return sharedInstance;
}

-(void) GetRequest:(NSString *) stringURL andParameter:(NSDictionary *) parameter withCompletionBlock:(completionHandler)responseHandler{
  NSString *stringFormOfUrl = [NSString stringWithFormat:(@"%@%@&appid=%@"),kBASEURL,stringURL,kWeatherAPIKey];

AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
AFJSONRequestSerializer *serializer = [AFJSONRequestSerializer serializer];
[serializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
manager.requestSerializer = serializer;
  
  
  [manager GET:stringFormOfUrl parameters:parameter headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    NSNumber *code = [responseObject objectForKey:@"cod"];
    if ([code isEqualToNumber:@200 ]){
          responseHandler(YES,responseObject);
      } else {
          responseHandler(NO,responseObject);
      }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
      responseHandler(NO,nil);
    }];
}
  


@end
