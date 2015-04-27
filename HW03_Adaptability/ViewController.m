//
//  ViewController.m
//  HW03_Adaptability
//
//  Created by Man, Keren on 4/26/15.
//  Copyright (c) 2015 Man, Keren. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //read plist
    NSURL *plistURL = [[NSBundle mainBundle] URLForResource: @"WeatherData" withExtension:@"plist"];
    NSDictionary *weatherInfo = [NSDictionary dictionaryWithContentsOfURL:plistURL];
    NSArray *hourlyForecast = weatherInfo[@"New item"][@"HourlyForecast"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
