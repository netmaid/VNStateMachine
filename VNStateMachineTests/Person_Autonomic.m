//
//  Person_Autonomic.m
//  VNStateMachine
//
//  Created by netmaid on 2015. 11. 16..
//  Copyright © 2015 netmaid. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "VNStateMachine.h"
#import "Person.h"


@implementation Person_Autonomic

CREATE_SHARED_STATE

-(void)enter:(id)entity
{
}

-(void)execute:(id)entity
{
}

-(void)exit:(id)entity
{
}

-(BOOL)onMsg:(id)entity_ withMsg:(VNStateMsg*)msg
{
	Person* entity = entity_;
	
	switch (msg.msg)
	{
		case MsgEatMeal:
			[entity.machine changeState:[Person_Eating state]];
			return YES;
		
		default:
			break;
	}
	return NO;
}

@end
