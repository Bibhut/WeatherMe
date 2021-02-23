//
//  ViewController.m
//  WeatherMe
//
//  Created by Bibhut Bikram Thakuri on 20/2/2021.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "WebserviceConstants.h"
#import "WMNetworking.h"
#import "Constants.h"
#import "WeatherService.h"
#import "Weather.h"
#import "Main.h"
#import "Global.h"
#import "UIImageView+AFNetworking.h"

@import GooglePlaces;
@import UIKit;



@interface ViewController ()<GMSAutocompleteTableDataSourceDelegate, UISearchBarDelegate>

@end

@implementation ViewController

#pragma mark - Variables

UITableView *tableView;
GMSAutocompleteTableDataSource *tableDataSource;


#pragma mark - view lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initialLoad];
    // Do any additional setup after loading the view.
}


#pragma mark - IBACtions

- (IBAction)showWeather:(id)sender {
    NSString *searchText = [self.searchText.text stringByReplacingOccurrencesOfString:@" " withString:@""]  ;
    if ([searchText isEqual: @""]) {
        return;
    }
    
    [WeatherService getCurrentWeatherDataFromCity:searchText handler:^(Location *locationWeatherData) {
        [self populateWeatherData:locationWeatherData];
    } onFailureHandler:^(NSString *message) {
        [self showFailureAlert:message];
    }];
}

#pragma mark - methods

-(void)initialLoad{
    tableDataSource = [[GMSAutocompleteTableDataSource alloc] init];
    tableDataSource.delegate = self;
    tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, self.view.frame.size.height - 44)];
    tableView.delegate = tableDataSource;
    tableView.dataSource = tableDataSource;
    [tableView setHidden:YES];
    [self.view addSubview:tableView];
}

-(void)showFailureAlert:(NSString *)message{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@""
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)populateWeatherData:(Location *)locationDetail {
    self.lblDate.text = [Global getDateFromNsNumber:locationDetail.currentDate];
    self.lblCityName.text = locationDetail.name;
    self.lblTemperature.text = [Global getCelciusFromKelvin:locationDetail.main.avgTemp];
    Weather *weather = locationDetail.weather.firstObject;
    self.lblWeather.text = weather.main;
    self.lblHumidity.text = [NSString stringWithFormat:@"Humidity: %@%%",locationDetail.main.humidity];
    NSString *weatherImgUrl= [NSString stringWithFormat:@"https://openweathermap.org/img/wn/%@@2x.png",weather.icon];
    [self.imgWeatherIcon setImageWithURL:[NSURL URLWithString:weatherImgUrl] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
}


#pragma mark - GMSAutocompleteTableDataSourceDelegate

- (void)didUpdateAutocompletePredictionsForTableDataSource:(GMSAutocompleteTableDataSource *)tableDataSource {
    // Turn the network activity indicator off.
    [tableView setHidden:NO];
    // Reload table data.
    [tableView reloadData];
}

- (void)didRequestAutocompletePredictionsForTableDataSource:(GMSAutocompleteTableDataSource *)tableDataSource {
    
    // Reload table data.
    [tableView reloadData];
}

- (void)tableDataSource:(GMSAutocompleteTableDataSource *)tableDataSource didAutocompleteWithPlace:(GMSPlace *)place {
    // Do something with the selected place.
    [tableView setHidden:YES];
    self.searchText.text = place.name;
}

- (void)tableDataSource:(GMSAutocompleteTableDataSource *)tableDataSource didFailAutocompleteWithError:(NSError *)error {
    // Handle the error
    NSLog(@"Error %@", error.description);
}

- (BOOL)tableDataSource:(GMSAutocompleteTableDataSource *)tableDataSource didSelectPrediction:(GMSAutocompletePrediction *)prediction {
    return YES;
}

#pragma mark - UISearchBarDelegate

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    // Update the GMSAutocompleteTableDataSource with the search text.
    searchText = [searchText stringByReplacingOccurrencesOfString:@" " withString:@""]  ;
    if ([searchText  isEqual: @""]) {
        [tableView setHidden:YES];
    } else {
        [tableDataSource sourceTextHasChanged:searchText];
        [tableView setHidden:NO];
    }
}

@end





