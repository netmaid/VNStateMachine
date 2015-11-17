//
//  VNStateMsgDispatcher.h
//  VNStateMachine
//
//  Created by netmaid on 2015. 11. 15..
//  Copyright © 2015 netmaid. All rights reserved.
//

@interface VNStateMsgDispatcher: VNStateEntityManager

-(instancetype)initWithTimeInterval:(NSTimeInterval)interval withEntityUpdate:(BOOL)update;

-(void)dispatchMsg:(VNStateMsg*)msg delay:(NSTimeInterval)delay;
-(void)dispatchDelayedMsgs;

@end
