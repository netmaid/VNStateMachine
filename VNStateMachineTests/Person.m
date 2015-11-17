//
//  Person.m
//  VNStateMachine
//
//  Created by netmaid on 2015. 11. 16..
//  Copyright © 2015 netmaid. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "VNStateMachine.h"
#import "Person.h"

@interface Person()
{
	NSInteger	eatingMeal;
}
@end

@implementation Person

-(instancetype)init
{
	if (self = [super init])
	{
		_sleepingHour = 0;
		_workingHour = 0;
		_dispatcher = nil;
		
		eatingMeal = 0;
	}
	return self;
}

-(void)sleep
{
	_sleepingHour++;
	_workingHour = 0;
	
	if (eatingMeal > 0)
		eatingMeal--;
}

-(void)work
{
	_sleepingHour = 0;
	_workingHour++;
	
	if (eatingMeal > 0)
		eatingMeal--;
}

-(void)eat
{
	eatingMeal += 2;
}

-(BOOL)full
{
	return eatingMeal >= 4;
}

@end
