//
//  VNStateMachine.m
//  VNStateMachine
//
//  Created by netmaid on 2015. 11. 15..
//  Copyright © 2015 netmaid. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VNStateMsg.h"
#import "VNState.h"
#import "VNStateEntity.h"
#import "VNStateMachine_.h"


@implementation VNStateMachine

-(instancetype)initWithOwner:(id)owner
{
	if (self = [self init])
	{
		_owner = owner;
	}
	return self;
}

-(void)update
{
	if (_globalState)
		[_globalState execute:_owner];
	if (_curState)
		[_curState execute:_owner];
}

-(void)changeState:(VNStatePtr)newState
{
	NSAssert(newState, @"null state!");
	_prevState = _curState;
	[_curState exit:_owner];
	_curState = newState;
	[_curState enter:_owner];
}

-(void)revertToPrevState
{
	[self changeState:_prevState];
}

-(BOOL)handleMsg:(VNStateMsg*)msg
{
	if (_curState && [_curState onMsg:_owner withMsg:msg])
		return YES;
	if (_globalState && [_globalState onMsg:_owner withMsg:msg])
		return YES;
	return NO;
}

@end



@interface VNStateObject ()
{
	VNStateID	stateId;
}
@end


@implementation VNStateObject

-(instancetype)initWithId:(VNStateID)sid state:(VNStatePtr)state
{
	return [self initWithId:sid state:state globalState:nil];
}

-(instancetype)initWithId:(VNStateID)sid state:(VNStatePtr)state globalState:(VNStatePtr)globalState
{
	if (self = [self init])
	{
		stateId = sid;
		_machine = [[VNStateMachine alloc] initWithOwner:self];
		_machine.curState = state;
		_machine.globalState = globalState;
	}
	return self;
}

-(VNStateID)sid
{
	return stateId;
}

-(void)update
{
	[_machine update];
}

-(BOOL)handleMsg:(VNStateMsg*)msg
{
	return [_machine handleMsg:msg];
}

@end
