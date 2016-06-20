//
//  VNState.h
//  VNStateMachine
//
//  Created by netmaid on 2015. 11. 15..
//  Copyright © 2015 netmaid. All rights reserved.
//

@class VNStateMsg;


@protocol VNState <NSObject>

+(instancetype)state;

-(void)enter:(id)entity;
-(void)execute:(id)entity;
-(void)exit:(id)entity;
-(BOOL)onMsg:(id)entity withMsg:(VNStateMsg*)msg;

@end


typedef NSObject<VNState>*	VNStatePtr;


#define CREATE_SHARED_STATE \
	+(instancetype)state { \
		static dispatch_once_t once; \
		static id instance = nil; \
		dispatch_once(&once, ^{ \
			instance = [[[self class] alloc] init]; \
		}); \
		return instance; \
	}
