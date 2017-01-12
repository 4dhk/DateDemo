//
//  LSDateTool.h
//  DateDemo
//
//  Created by  舒柳洋 on 2017/1/12.
//  Copyright © 2017年 Liuyang Shu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSDateTool : NSObject

/**
 获取系统当前日期

 @return <#return value description#>
 */
+ (NSString *)getCurrentDate;

/**
 string转date

 @param dateString <#dateString description#>
 @return <#return value description#>
 */
+ (NSDate *)stringToDateWithString:(NSString *)dateString;


/**
 date转string

 @param date <#date description#>
 @return <#return value description#>
 */
+ (NSString *)dateToStringWithDate:(NSDate *)date;



/**
 比较两个日期先后

 @param date1 <#date1 description#>
 @param date2 <#date2 description#>
 @return <#return value description#>
 */
+(NSDate *)compareDate:(NSString*)date1 withDate:(NSString*)date2;


/**
 本地日期转UTC

 @param localDate <#localDate description#>
 @return <#return value description#>
 */
+ (NSString *)getUTCFormaterWithLocalDate:(NSString *)localDate;


/**
 UTC转本地日期

 @param utcDate <#utcDate description#>
 @return <#return value description#>
 */
+ (NSString *)getLocalDateFormaterWithUTCDate:(NSString *)utcDate;


/**
 本地日期转GMT

 @param localDate 本地日期
 @return 转换后的日期字符串
 */
+ (NSString *)getGMTFormaterWithLocalDate:(NSDate *)localDate;


/**
 GMT转本地日期

 @param GMTDate GMT日期
 @return 转换后的日期字符串
 */
+ (NSString *)getLocalDateFormaterWithGMTDate:(NSString *)GMTDate;

@end