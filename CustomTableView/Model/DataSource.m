//
//  DataSource.m
//  CustomTableView
//
//  Created by 一米阳光 on 2017/4/17.
//  Copyright © 2017年 一米阳光. All rights reserved.
//

#import "DataSource.h"

@implementation DataSource

+ (NSArray *)getUserInfo {
    NSString * path = [[NSBundle mainBundle] pathForResource:@"users" ofType:@"plist"];
    NSArray * arrayReturn = [NSArray arrayWithContentsOfFile:path];
    return arrayReturn;
}

@end
