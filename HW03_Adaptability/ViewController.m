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
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self readPList];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) readPList{
    NSURL *plistURL = [[NSBundle mainBundle] URLForResource: @"WeatherData" withExtension:@"plist"];
    NSDictionary *weatherInfo = [NSDictionary dictionaryWithContentsOfURL:plistURL];
    NSArray *hourlyForecast = weatherInfo[@"New item"][@"HourlyForecast"];
    NSString *city = weatherInfo[@"New item"][@"City"];
    NSString *sunrise =weatherInfo[@"New item"][@"Sunrise"];
    NSString *sunset =weatherInfo[@"New item"][@"Sunset"];
}

@end
