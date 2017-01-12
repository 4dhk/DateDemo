//
//  ViewController.m
//  DateDemo
//
//  Created by  舒柳洋 on 2017/1/12.
//  Copyright © 2017年 Liuyang Shu. All rights reserved.
//

#import "ViewController.h"
#import "LSDateTool.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *string = @"2016-1-12 00-00-00";
    


    
    //string转date
    NSDate *stringToDate = [LSDateTool stringToDateWithString:string];
    
    NSLog(@"string转date:%@",stringToDate);
    
    //date转string
    NSString *dateToString = [LSDateTool dateToStringWithDate:stringToDate];
    
    NSLog(@"date转string:%@",dateToString);
    
    //当前时间
    NSString *currentDate = [LSDateTool getCurrentDate];
    NSLog(@"当前时间:%@",currentDate);
    
    //时间比较
    NSDate *compareDate = [LSDateTool compareDate:currentDate withDate:string];
    NSLog(@"时间比较:%@",compareDate);
    
    //本地时间转GMT
    NSString *GMTString = [LSDateTool getGMTFormaterWithLocalDate:stringToDate];
    
    NSLog(@"GMTString:%@",GMTString);
    
    //GMT转本地时间
    NSString *localDateString = [LSDateTool getLocalDateFormaterWithGMTDate:GMTString];
    
    NSLog(@"localDateString:%@",localDateString);

    //本地时间转UTC
    NSString *utcDateString = [LSDateTool getUTCFormaterWithLocalDate:string];
    NSLog(@"utcDateString:%@",utcDateString);
    
    //UTC转本地时间
    NSString *utcToLocalString = [LSDateTool getLocalDateFormaterWithUTCDate:utcDateString];
    NSLog(@"utcToLocalString:%@",utcToLocalString);
    
}

@end
