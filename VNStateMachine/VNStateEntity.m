//
//  VNStateEntity.m
//  VNStateMachine
//
//  Created by netmaid on 2015. 11. 15..
//  Copyright © 2015 netmaid. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VNStateMsg.h"
#import "VNStateEntity.h"


@implementation NSObject (VNStateEntityDefaultImplementaion)

-(void)update
{
	// Nothing to do
}

-(BOOL)handleMsg:(VNStateMsg*)msg
{
	// Nothing to do
	return NO;
}

@end
