//
//  ViewController.m
//  HW03_Adaptability
//
//  Created by Man, Keren on 4/26/15.
//  Copyright (c) 2015 Man, Keren. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic) NSArray *hourlyForecast;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *sunrise;
@property (nonatomic, copy) NSString *sunset;
@property (weak, nonatomic) IBOutlet UILabel *lblCity;
@property (weak, nonatomic) IBOutlet UILabel *lblCurrentTemperature;
@property (weak, nonatomic) IBOutlet UILabel *lbl8am;
@property (weak, nonatomic) IBOutlet UILabel *lbl9am;
@property (weak, nonatomic) IBOutlet UILabel *lbl10am;
@property (weak, nonatomic) IBOutlet UILabel *lbl8amTemp;
@property (weak, nonatomic) IBOutlet UILabel *lbl9amTemp;
@property (weak, nonatomic) IBOutlet UILabel *lbl10amTemp;
@property (weak, nonatomic) IBOutlet UILabel *lblSunrise;
@property (weak, nonatomic) IBOutlet UILabel *lblSunset;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self readPList];
    
    //display data
    self.lblCity.text = self.city;
    self.lbl8amTemp.text =  [NSString stringWithFormat:@"%@", [self.hourlyForecast objectAtIndex:8]];
    self.lbl9amTemp.text = [NSString stringWithFormat:@"%@", [self.hourlyForecast objectAtIndex:9]];
    self.lbl10amTemp.text = [NSString stringWithFormat:@"%@", [self.hourlyForecast objectAtIndex:10]];
    NSInteger currentHour = [self CurrentTimeHour];
    self.lblCurrentTemperature.text = [NSString stringWithFormat:@"%@", [self.hourlyForecast objectAtIndex: currentHour]];
    self.lblSunrise.text = self.sunrise;
    self.lblSunset.text = self.sunset;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)CurrentTimeHour{
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitHour fromDate:now];
    return [components hour];
}

-(void) readPList{
    NSURL *plistURL = [[NSBundle mainBundle] URLForResource: @"WeatherData" withExtension:@"plist"];
    NSDictionary *weatherInfo = [NSDictionary dictionaryWithContentsOfURL:plistURL];
    self.hourlyForecast = weatherInfo[@"New item"][@"HourlyForecast"];
    self.city = weatherInfo[@"New item"][@"City"];
    self.sunrise =weatherInfo[@"New item"][@"Sunrise"];
    self.sunset =weatherInfo[@"New item"][@"Sunset"];
}

@end
