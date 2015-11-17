//
//  VNStateMsg.h
//  VNStateMachine
//
//  Created by netmaid on 2015. 11. 15..
//  Copyright © 2015 netmaid. All rights reserved.
//

typedef NSInteger	VNStateID;


@interface VNStateMsg: NSObject

@property (readonly) VNStateID			sender;
@property (readonly) VNStateID			receiver;
@property (readonly) NSInteger			msg;
@property (nonatomic,weak,readonly) id 	info;
@property NSTimeInterval				time;

-(instancetype)init;
-(instancetype)initWithStateId:(VNStateID)sender receiver:(VNStateID)receiver msg:(NSInteger)msg info:(id)info;

@end
