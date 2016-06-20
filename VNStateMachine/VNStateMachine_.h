//
//  VNStateMachine_.h
//  VNStateMachine
//
//  Created by netmaid on 2015. 11. 15..
//  Copyright © 2015 netmaid. All rights reserved.
//

@class VNStateMsg;


@interface VNStateMachine<__covariant ObjectType>: NSObject

@property (nonatomic,weak,readonly) ObjectType owner;
@property (nonatomic,weak) VNStatePtr	curState;
@property (nonatomic,weak) VNStatePtr	prevState;
@property (nonatomic,weak) VNStatePtr	globalState;

-(instancetype)initWithOwner:(ObjectType)owner;
-(void)update;
-(void)changeState:(VNStatePtr)newState;
-(void)revertToPrevState;
-(BOOL)handleMsg:(VNStateMsg*)msg;

@end


@interface VNStateObject<__covariant ObjectType>: NSObject<VNStateEntity>

@property (nonatomic,strong,readonly) VNStateMachine*	machine;

-(instancetype)initWithId:(VNStateID)sid state:(VNStatePtr)state;
-(instancetype)initWithId:(VNStateID)sid state:(VNStatePtr)state globalState:(VNStatePtr)globalState;
-(void)update;
-(BOOL)handleMsg:(VNStateMsg*)msg;

@end
