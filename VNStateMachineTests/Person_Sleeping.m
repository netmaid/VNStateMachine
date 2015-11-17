//
//  Person_Ready.m
//  VNStateMachine
//
//  Created by netmaid on 2015. 11. 16..
//  Copyright © 2015 netmaid. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "VNStateMachine.h"
#import "Person.h"


@implementation Person_Sleeping

CREATE_SHARED_STATE

-(void)enter:(id)entity
{
	NSLog(@"sleeping: enter");
}

-(void)execute:(id)entity_
{
	NSLog(@"sleeping: execute");
	Person* entity = entity_;
	
	[entity sleep];
	
	if (entity.sleepingHour >= 6)
	{
		[entity.machine changeState:[Person_Working state]];
		return;
	}
}

-(void)exit:(id)entity
{
	NSLog(@"sleeping: exit");
}

-(BOOL)onMsg:(id)entity withMsg:(VNStateMsg*)msg
{
	return NO;
}

@end
