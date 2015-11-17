//
//  PersonAsyncTests.m
//  VNStateMachine
//
//  Created by ened on 2015. 11. 16..
//  Copyright © 2015년 netmaid. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "VNStateMachine.h"
#import "Person.h"

@interface PersonAsyncTests : XCTestCase
{
	VNStateMsgDispatcher*	msgDispatcher;
	Person*					person;
}
@end


@implementation PersonAsyncTests

- (void)setUp {
    [super setUp];
	
	msgDispatcher = [[VNStateMsgDispatcher alloc] initWithTimeInterval:0.01 withEntityUpdate:YES];
	
	person = [[Person alloc] initWithId:100
								  state:[Person_Sleeping state]
							globalState:[Person_Autonomic state]];
	[msgDispatcher registerEntity:person];
	person.dispatcher = msgDispatcher;
	person.machine.globalState = [Person_Autonomic state];
}

- (void)tearDown {
	[msgDispatcher unregisterEntity:person];
	
    [super tearDown];
}

- (void)testExample {
	NSDate *timeoutDate = [NSDate dateWithTimeIntervalSinceNow:2];
	[[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:timeoutDate];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
