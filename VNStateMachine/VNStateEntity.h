//
//  VNStateEntity.h
//  VNStateMachine
//
//  Created by netmaid on 2015. 11. 15..
//  Copyright © 2015 netmaid. All rights reserved.
//

@protocol VNStateEntity <NSObject>

@property (readonly) VNStateID sid;

-(void)update;
-(BOOL)handleMsg:(VNStateMsg*)msg;

@end


@interface NSObject (VNStateEntityDefaultImplementaion)

-(void)update;
-(BOOL)handleMsg:(VNStateMsg*)msg;

@end


typedef NSObject<VNStateEntity>*	VNStateEntityPtr;
