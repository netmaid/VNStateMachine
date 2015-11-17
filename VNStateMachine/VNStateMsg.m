//
//  VNStateMsg.m
//  VNStateMachine
//
//  Created by netmaid on 2015. 11. 15..
//  Copyright © 2015 netmaid. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VNStateMsg.h"


@implementation VNStateMsg

-(instancetype)init
{
	if (self = [super init])
	{
		_sender = 0;
		_receiver = 0;
		_msg = 0;
		_info = nil;
		_time = 0;
	}
	return self;
}

-(instancetype)initWithStateId:(VNStateID)sender receiver:(VNStateID)receiver msg:(NSInteger)msg info:(id)info
{
	if (self = [super init])
	{
		_sender = sender;
		_receiver = receiver;
		_msg = msg;
		_info = info;
		_time = 0;
	}
	return self;
}

-(void)dealloc
{
	//NSLog(@"dealloc VStateMsg");
}

@end
