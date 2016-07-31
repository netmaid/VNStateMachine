//
//  VNStateMachineTests.m
//  VNStateMachineTests
//
//  Created by netmaid on 2015. 11. 15..
//  Copyright © 2015 netmaid. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "VNStateMachine.h"
#import "Person.h"

@interface PersonSyncTests : XCTestCase
{
	VNStateMsgDispatcher*	msgDispatcher;
	Person*					person;
}
@end


@implementation PersonSyncTests

- (void)setUp {
	[super setUp];
	
	msgDispatcher = [[VNStateMsgDispatcher alloc] initWithTimeInterval:0.1 withEntityUpdate:NO];
	
	person = [[Person alloc] initWithId:100
								  state:[Person_Sleeping state]
							globalState:[Person_Autonomic state]];
	[msgDispatcher registerEntity:person];
	person.dispatcher = msgDispatcher;
}

- (void)tearDown {
	[msgDispatcher unregisterEntity:person];
	[msgDispatcher endMsgDispatcher];
	msgDispatcher = nil;
	person = nil;
	
	[super tearDown];
}

- (void)testExample {
	for (int i = 0; i <= 24; i++)
	{
		[msgDispatcher updateAllEntities];
		[msgDispatcher dispatchDelayedMsgs];
	}
}

- (void)testPerformanceExample {
	// This is an example of a performance test case.
	[self measureBlock:^{
		// Put the code you want to measure the time of here.
	}];
}

@end
