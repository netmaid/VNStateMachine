//
//  Person_Eating.m
//  VNStateMachine
//
//  Created by netmaid on 2015. 11. 16..
//  Copyright © 2015 netmaid. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "VNStateMachine.h"
#import "Person.h"


@implementation Person_Eating

CREATE_SHARED_STATE

-(void)enter:(id)entity
{
	NSLog(@"eating: enter");
}

-(void)execute:(id)entity_
{
	NSLog(@"eating: execute");
	Person* entity = entity_;
	
	[entity eat];
	if (entity.full)
	{
		[entity.machine revertToPrevState];
		return;
	}
}

-(void)exit:(id)entity
{
	NSLog(@"eating: exit");
}

-(BOOL)onMsg:(id)entity withMsg:(VNStateMsg*)msg
{
	return NO;
}

@end
