//
//  LSDateTool.m
//  DateDemo
//
//  Created by  舒柳洋 on 2017/1/12.
//  Copyright © 2017年 Liuyang Shu. All rights reserved.
//

#import "LSDateTool.h"

@implementation LSDateTool
/**
 获取当前的日期
 日期格式为:yyyy-MM-dd HH-mm-ss，可自定义
 */
+ (NSString *)getCurrentDate
{
    // 设置 日期的格式
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH-mm-ss"];
    
    // 获取 当前系统时间
    NSString *dataTime = [formatter stringFromDate:[NSDate date]];
    return dataTime;
}

/**
 string转为date

 @param dateString 日期字符串
 @return 转换后的date
 */
+ (NSDate *)stringToDateWithString:(NSString *)dateString
{
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    format.dateFormat = @"yyyy-MM-dd HH-mm-ss";
    
    // NSString * -> NSDate *
    NSDate *date = [format dateFromString:dateString];
    return date;
}


/**
 date转string

 @param date 日期
 @return 转换后的日期字符串
 */
+ (NSString *)dateToStringWithDate:(NSDate *)date
{
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    format.dateFormat = @"yyyy-MM-dd HH-mm-ss";
    
    // NSDate * -> NSString *
    NSString *string = [format stringFromDate:date];
    return string;
}

/**
 比较两个日期的大小
 日期格式为:yyyy-MM-dd HH-mm-ss，可自定义
 */
+(NSDate *)compareDate:(NSString*)date1 withDate:(NSString*)date2{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH-mm-ss"];
    NSDate *dt1 = [[NSDate alloc] init];
    NSDate *dt2 = [[NSDate alloc] init];
    dt1 = [dateFormatter dateFromString:date1];
    dt2 = [dateFormatter dateFromString:date2];
    NSComparisonResult result = [dt1 compare:dt2];
    switch (result)
    {
            //date2比date1大
        case NSOrderedAscending: return dt1; break;
            //date2比date1小
        case NSOrderedDescending: return dt2; break;
            //date2=date1
        default: NSLog(@"erorr dates %@, %@", dt2, dt1); break;
    }
    return nil;
}



/**
 将本地日期字符串转为UTC日期字符串
 输入输出格式可自定义

 @param localDate 本地时间
 @return 转换后的时间字符串
 */
+ (NSString *)getUTCFormaterWithLocalDate:(NSString *)localDate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //输入格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *dateFormatted = [dateFormatter dateFromString:localDate];
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
    [dateFormatter setTimeZone:timeZone];
    //输出格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    NSString *dateString = [dateFormatter stringFromDate:dateFormatted];
    return dateString;
}


/**
 将UTC日期字符串转为本地时间字符串
 输入输出格式可自定义
 
 @param utcDate UTC时间
 @return 转换后的时间字符串
 */
+ (NSString *)getLocalDateFormaterWithUTCDate:(NSString *)utcDate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //输入格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    NSTimeZone *localTimeZone = [NSTimeZone localTimeZone];
    [dateFormatter setTimeZone:localTimeZone];
    
    NSDate *dateFormatted = [dateFormatter dateFromString:utcDate];
    //输出格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateString = [dateFormatter stringFromDate:dateFormatted];
    return dateString;
}

/**
 将本地日期字符串转为GMT日期字符串
 输入输出格式可自定义

 @param localDate 本地日期
 @return 转换后的日期字符串
 */
+ (NSString *)getGMTFormaterWithLocalDate:(NSDate *)localDate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    [dateFormatter setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"en"]];
    [dateFormatter setDateFormat:@"EEE, dd MMM yyyy HH:mm:ss 'GMT'"];
    NSString *currentDateStr = [dateFormatter stringFromDate:localDate];
    return currentDateStr;
}

/**
 将GMT日期字符串转为本地日期字符串
 输入输出格式可自定义
 
 @param GMTDate GMT日期
 @return 转换后的日期字符串
 */
+ (NSString *)getLocalDateFormaterWithGMTDate:(NSString *)GMTDate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEE, dd MMM yyyy HH:mm:ss 'GMT'"];
    NSDate *localeDate = [dateFormatter dateFromString:GMTDate];
    //这里设置的是东八区
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"GMT+0800"]];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *localeTimeStr =[dateFormatter stringFromDate:localeDate];
    return localeTimeStr;
}

/**
 时间戳转时间
 
 @param timeStamp 时间戳
 @return 时间字符串
 */
+ (NSString *)timeStampTransToTime:(NSString *)timeStamp
{
    NSTimeInterval time=[timeStamp doubleValue];//如果不使用本地时区,因为时差问题要加8小时 == 28800 sec
    NSDate *detaildate=[NSDate dateWithTimeIntervalSince1970:time];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];//设置本地时区
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yy-MM-dd HH-mm-ss"];
    
    NSString *currentDateStr = [dateFormatter stringFromDate: detaildate];
    
    return currentDateStr;
}

/**
 时间转时间戳
 
 @param time 时间
 @return 时间戳
 */
+(NSString *)timeTransTotimeStamp:(NSString *)time
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]]; //设置本地时区
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH-mm-ss"];
    NSDate *date = [dateFormatter dateFromString:time];
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[date timeIntervalSince1970]];//时间戳
    return timeSp;
}


/**
 判断date是否是今天

 @param date 需要判断的日期
 @return 是/不是今天
 */
+ (BOOL)isTodayWithDate:(NSDate *)date{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    // 获取时间
    NSDateComponents *selfCmps = [calendar components:unit fromDate:date];
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    
    return selfCmps.year == nowCmps.year && selfCmps.month == nowCmps.month && selfCmps.day == nowCmps.day;
}

/**
 判断date是否是昨天
 
 @param date 需要判断的日期
 @return 是/不是昨天
 */
+ (BOOL)isYestodayWithDate:(NSDate *)date{
    // 生成只有年月日的日期对象
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    
    NSString *selfString = [fmt stringFromDate:date];
    NSDate *selfDate = [fmt dateFromString:selfString];
    
    NSString *nowString = [fmt stringFromDate:[NSDate date]];
    NSDate *nowDate = [fmt dateFromString:nowString];
    
    // 比较时间差
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *cmps = [calendar components:unit fromDate:selfDate toDate:nowDate options:0];
    
    return cmps.year == 0 && cmps.month == 0 && cmps.day == 1;
}

/**
 判断date是否是明天
 
 @param date 需要判断的日期
 @return 是/不是明天
 */
+ (BOOL)isTomorrowWithDate:(NSDate *)date{
    // 生成只有年月日的日期对象
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    
    NSString *selfString = [fmt stringFromDate:date];
    NSDate *selfDate = [fmt dateFromString:selfString];
    
    NSString *nowString = [fmt stringFromDate:[NSDate date]];
    NSDate *nowDate = [fmt dateFromString:nowString];
    
    // 比较时间差
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *cmps = [calendar components:unit fromDate:selfDate toDate:nowDate options:0];
    
    return cmps.year == 0 && cmps.month == 0 && cmps.day == -1;
}

/**
 判断date是否是今年
 
 @param date 需要判断的日期
 @return 是/不是今年
 */
+ (BOOL)isThisYearWithDate:(NSDate *)date{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSInteger selfYear = [calendar component:NSCalendarUnitYear fromDate:date];
    NSInteger nowYear = [calendar component:NSCalendarUnitYear fromDate:[NSDate date]];
    
    return selfYear == nowYear;
}
@end
