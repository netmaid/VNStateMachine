//
//  Person.h
//  VNStateMachine
//
//  Created by netmaid on 2015. 11. 16..
//  Copyright © 2015 netmaid. All rights reserved.
//


@interface Person: VNStateObject
@property (nonatomic) NSInteger sleepingHour;
@property (nonatomic) NSInteger workingHour;
@property (nonatomic,readonly) BOOL full;
@property (nonatomic,weak) VNStateMsgDispatcher* dispatcher;

-(void)sleep;
-(void)work;
-(void)eat;
@end


@interface Person_Sleeping: NSObject<VNState>
@end


@interface Person_Working: NSObject<VNState>
@end


@interface Person_Eating: NSObject<VNState>
@end


@interface Person_Autonomic: NSObject<VNState>
@end


enum MsgForPerson
{
	MsgEatMeal = 10,
};
