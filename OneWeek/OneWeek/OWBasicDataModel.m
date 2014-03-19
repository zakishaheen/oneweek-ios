//
//  OWBasicDataModel.m
//  OneWeek
//
//  Created by Zaki Shaheen on 3/18/14.
//  Copyright (c) 2014 Zaki Shaheen. All rights reserved.
//

#import "OWBasicDataModel.h"

@implementation OWBasicDataModel
+ (NSArray *) allMeasurements{
    
    return @[ @{@"name" : @"head", @"type" : @"length"},
              @{@"name" : @"neck", @"type" : @"length"},
              @{@"name" : @"breast_size", @"type" : @"length"},
              @{@"name" : @"chest", @"type" : @"length"},
              @{@"name" : @"shoulders", @"type" : @"length"},
              @{@"name" : @"forearm", @"type" : @"length"},
              @{@"name" : @"bicep", @"type" : @"length"},
              @{@"name" : @"waist", @"type" : @"length"},
              @{@"name" : @"hip", @"type" : @"length"},
              @{@"name" : @"thigh", @"type" : @"length"},
              @{@"name" : @"calf", @"type" : @"length"},
              @{@"name" : @"height", @"type" : @"length"},
              @{@"name" : @"weight", @"type" : @"mass"},
              @{@"name" : @"age", @"type" : @"time"},
              @{@"name" : @"bfp", @"type" : @"unitless"},
              @{@"name" : @"bmi", @"type" : @"unitless"},
              @{@"name" : @"bmr", @"type" : @"unitless"},
              @{@"name" : @"whr", @"type" : @"unitless"},
              @{@"name" : @"whtr", @"type" : @"unitless"},
              ];
}
@end
