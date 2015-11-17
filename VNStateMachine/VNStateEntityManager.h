//
//  VNStateEntityManager.h
//  VNStateMachine
//
//  Created by netmaid on 2015. 11. 15..
//  Copyright © 2015 netmaid. All rights reserved.
//

@interface VNStateEntityManager: NSObject

-(void)clear;
-(void)registerEntity:(VNStateEntityPtr)entity;
-(void)unregisterEntity:(VNStateEntityPtr)entity;
-(VNStateEntityPtr)getEntity:(VNStateID)sid;
-(void)updateAllEntities;

@end
