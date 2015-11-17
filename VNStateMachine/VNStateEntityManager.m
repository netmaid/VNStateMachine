//
//  VNStateEntityManager.m
//  VNStateMachine
//
//  Created by netmaid on 2015. 11. 15..
//  Copyright © 2015 netmaid. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VNStateMsg.h"
#import "VNStateEntity.h"
#import "VNStateEntityManager.h"


@interface VNStateEntityManager ()
{
	NSMutableDictionary*	entityMaps;
}
@end


@implementation VNStateEntityManager

-(instancetype)init
{
	if (self = [super init])
	{
		entityMaps = [NSMutableDictionary dictionary];
	}
	
	return self;
}

-(void)clear
{
	[entityMaps removeAllObjects];
}

-(void)registerEntity:(VNStateEntityPtr)entity
{
	[entityMaps setObject:entity forKey: [NSNumber numberWithInteger:entity.sid]];
}

-(void)unregisterEntity:(VNStateEntityPtr)entity
{
	[entityMaps removeObjectForKey: [NSNumber numberWithInteger:entity.sid]];
}

-(VNStateEntityPtr)getEntity:(VNStateID)sid
{
	return entityMaps[ [NSNumber numberWithInteger:sid] ];
}

-(void)updateAllEntities
{
	NSEnumerator* enumerator = [entityMaps objectEnumerator];
	VNStateEntityPtr entity;
	while ((entity = [enumerator nextObject])) {
		[entity update];
	}
}

@end
