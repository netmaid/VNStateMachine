//
//  Person_Working.m
//  VNStateMachine
//
//  Created by netmaid on 2015. 11. 16..
//  Copyright © 2015 netmaid. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "VNStateMachine.h"
#import "Person.h"


@implementation Person_Working

CREATE_SHARED_STATE

-(void)enter:(id)entity
{
	NSLog(@"working: enter");
}

-(void)execute:(id)entity_
{
	NSLog(@"working: execute");
	Person* entity = entity_;
	
	[entity work];
	
	if (entity.workingHour%6 == 0)
	{
		VNStateMsg* msg = [[VNStateMsg alloc] initWithStateId:0 receiver:entity.sid msg:MsgEatMeal info:nil];
		[entity.dispatcher dispatchMsg:msg delay:0.1];
	}
	
	if (entity.workingHour >= 18)
	{
		[entity.machine changeState:[Person_Sleeping state]];
		return;
	}
}

-(void)exit:(id)entity
{
	NSLog(@"working: exit");
}

-(BOOL)onMsg:(id)entity withMsg:(VNStateMsg*)msg
{
	return NO;
}

@end
