//
//  AppDelegate.m
//  WeatherMe
//
//  Created by Bibhut Bikram Thakuri on 20/2/2021.
//

#import "AppDelegate.h"
@import GooglePlaces;
#import "Constants.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GMSPlacesClient provideAPIKey:kgoogleApiKey];
  // Override point for customization after application launch.
  return YES;
}




@end
