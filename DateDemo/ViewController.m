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
    
    NSString *formatter = @"yyyy-MM-dd HH:mm:ss";
    //TODO:string转date
    NSDate *stringToDate = [LSDateTool stringToDateWithString:string formatter:formatter];
    
    NSLog(@"string转date:%@",stringToDate);
    
    //TODO:date转string
    NSString *dateToString = [LSDateTool dateToStringWithDate:stringToDate formatter:formatter];
    
    NSLog(@"date转string:%@",dateToString);
    
    //TODO:当前时间
    NSString *currentDate = [LSDateTool getCurrentDateWithFormatter:formatter];
    NSLog(@"当前时间:%@",currentDate);
    
    //TODO:时间比较
    NSDate *compareDate = [LSDateTool compareDate:currentDate withDate:string formatter:formatter];
    NSLog(@"时间比较:%@",compareDate);
    
    //TODO:本地时间转GMT
    NSString *GMTString = [LSDateTool getGMTFormaterWithLocalDate:stringToDate formatter:formatter];
    
    NSLog(@"GMTString:%@",GMTString);
    
    //TODO:GMT转本地时间
    NSString *localDateString = [LSDateTool getLocalDateFormaterWithGMTDate:GMTString localFormatter:formatter];
    
    NSLog(@"localDateString:%@",localDateString);

    //TODO:本地时间转UTC
    NSString *utcFormatter = @"yyyy-MM-dd'T'HH:mm:ssZ";
    NSString *utcDateString = [LSDateTool getUTCFormatterWithLocalDate:string localDateFormatter:formatter UTCFormatter:utcFormatter];
    NSLog(@"utcDateString:%@",utcDateString);
    
    //TODO:UTC转本地时间
    NSString *utcToLocalString = [LSDateTool getLocalDateFormatterWithUTCDate:utcDateString UTCFormatter:utcFormatter localDateFormatter:formatter];
    NSLog(@"utcToLocalString:%@",utcToLocalString);
    
    //TODO:时间转时间戳
    NSDate *time = [NSDate date];
    NSString *timeString = [LSDateTool dateToStringWithDate:time formatter:formatter];
    NSString *timeSpString = [LSDateTool timeTransTotimeStamp:timeString inputFormatter:formatter];
    NSLog(@"timeSpString:%@", timeSpString);
    
    //TODO:时间戳转时间
    NSString *transedDate = [LSDateTool timeStampTransToTime:timeSpString outputFormatter:formatter];
    NSLog(@"transedDate:%@", transedDate);
    
    
    NSString *date1String = @"2017-01-19 12:12:12";
    NSString *data2String = @"2017-01-17 12:12:12";
    NSDate *date1 = [LSDateTool stringToDateWithString:date1String formatter:formatter];
    NSDate *date2 = [LSDateTool stringToDateWithString:data2String formatter:formatter];
    //TODO:判断是不是今天
    BOOL isToday1 = [LSDateTool isTodayWithDate:date1];
    if (isToday1) {
        NSLog(@"是今天 %@",date1);
    }else{
        NSLog(@"不是今天 %@",date1);
    }
    
    BOOL isToday2 = [LSDateTool isTodayWithDate:time];
    if (isToday2) {
        NSLog(@"是今天%@",time);
    }else{
        NSLog(@"不是今天%@",time);
    }
    //TODO:判断是不是昨天
    
    BOOL isYestoday1 = [LSDateTool isYestodayWithDate:date2];
    if (isYestoday1) {
        NSLog(@"是昨天%@",date2);
    }else{
        NSLog(@"不是昨天%@",date2);
    }
    
    BOOL isYestoday2 = [LSDateTool isYestodayWithDate:date1];
    if (isYestoday2) {
        NSLog(@"是昨天%@",date1);
    }else{
        NSLog(@"不是昨天%@",date1);
    }
}

@end
