//
//  VNStateMsgDispatcher.m
//  VNStateMachine
//
//  Created by netmaid on 2015. 11. 15..
//  Copyright © 2015 netmaid. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VNStateMsg.h"
#import "VNStateEntity.h"
#import "VNStateEntityManager.h"
#import "VNStateMsgDispatcher.h"

///////////////////////////////////////////////////////////////////////////////////////
#include <set>

struct StateMsg {
	VNStateMsg* msg;
};

typedef std::multiset<StateMsg>		PriorityQueue;

const int smallest_msg_delay = 33;		// 1000/33 => 30 fps

static inline int ABS_INT(int a)
{
	return (a < 0 ? -a: a);
}

static inline bool operator==(const StateMsg& m1, const StateMsg& m2)
{
	return	ABS_INT([m1.msg time] - [m2.msg time]) < smallest_msg_delay &&
		([m1.msg sender] == [m2.msg sender]) &&
		([m1.msg receiver] == [m2.msg receiver]) &&
		([m1.msg msg] == [m2.msg msg]);
}

static inline bool operator<(const StateMsg& m1, const StateMsg& m2)
{
	if (m1 == m2)
		return false;
	else
		return (int)([m1.msg time] - [m2.msg time]) < 0;
}
///////////////////////////////////////////////////////////////////////////////////////


@interface VNStateMsgDispatcher ()
{
	PriorityQueue*	_pq;
	BOOL			entityUpdate;
}
@property (nonatomic,strong) NSTimer*	timer;
@end


@implementation VNStateMsgDispatcher

-(instancetype)init
{
	if (self = [super init])
	{
		_pq = new PriorityQueue;
	}
	return self;
}

-(instancetype)initWithTimeInterval:(NSTimeInterval)interval withEntityUpdate:(BOOL)update;
{
	if (self = [self init])
	{
		_timer = [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(onTick:) userInfo:nil repeats:YES];
		entityUpdate = update;
	}
	return self;
}

-(void)dealloc
{
	if (_pq) {
		delete _pq;
		_pq = NULL;
	}
}

-(void)onTick:(NSTimer*)timer
{
	[self dispatchDelayedMsgs];
	
	if (entityUpdate)
		[self updateAllEntities];
}

-(void)clear
{
	[super clear];
	
	if (_pq) {
		_pq->clear();
	}
}

-(void)unregisterEntity:(VNStateEntityPtr)entity
{
	[super unregisterEntity:entity];
	
	VNStateID sid = entity.sid;
	if (_pq) {
		PriorityQueue::iterator it = ((PriorityQueue*)_pq)->begin();
		PriorityQueue::iterator end = ((PriorityQueue*)_pq)->end();
		while (it != end)
		{
			if ([it->msg receiver] == sid)
			{
				it = ((PriorityQueue*)_pq)->erase(it);
			}
			else
			{
				++it;
			}
		}
	}
}

-(void)dispatchMsg:(VNStateMsg*)msg delay:(NSTimeInterval)delay
{
	VNStateEntityPtr entity = [self getEntity:msg.receiver];
	if (!entity)
		return;
	
	if (delay <= 0)
	{
		[self dischargeMsg:msg forEntity: entity];
		return;
	}
	
	if (_pq)
	{
		NSTimeInterval cur = [NSDate timeIntervalSinceReferenceDate];
		msg.time = cur + delay;
		
		StateMsg state_msg;
		state_msg.msg = msg;
		
		_pq->insert(state_msg);
	}
}

-(void)dispatchDelayedMsgs
{
	if (!_pq)
		return;
	
	NSTimeInterval cur = [NSDate timeIntervalSinceReferenceDate];
	
	while (!_pq->empty() && (cur - [_pq->begin()->msg time]) < 0) {
		StateMsg state_msg = *_pq->begin();
		
		VNStateEntityPtr entity = [self getEntity:state_msg.msg.receiver];
		if (entity)
		{
			[self dischargeMsg:state_msg.msg forEntity:entity];
		}
		
		_pq->erase(_pq->begin());
	}
}

-(void)dischargeMsg:(VNStateMsg*)msg forEntity:(VNStateEntityPtr)entity
{
	[entity handleMsg:msg];
}

@end
