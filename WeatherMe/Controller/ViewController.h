//
//  ViewController.h
//  WeatherMe
//
//  Created by Bibhut Bikram Thakuri on 20/2/2021.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController<CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searchText;
@property (weak, nonatomic) IBOutlet UIView *vSearch;
@property (weak, nonatomic) IBOutlet UIButton *btnShowWeather;
@property (weak, nonatomic) IBOutlet UILabel *lblDate;
@property (weak, nonatomic) IBOutlet UILabel *lblCityName;
@property (weak, nonatomic) IBOutlet UILabel *lblTemperature;
@property (weak, nonatomic) IBOutlet UIImageView *imgWeatherIcon;
@property (weak, nonatomic) IBOutlet UILabel *lblWeather;
@property (weak, nonatomic) IBOutlet UILabel *lblHumidity;

-(void)showFailureAlert;

@end

