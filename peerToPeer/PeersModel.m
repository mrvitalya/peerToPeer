//
//  Peers.m
//  peerToPeer
//
//  Created by v_stepanov on 18.06.15.
//  Copyright (c) 2015 v_stepanov. All rights reserved.
//

#import "PeersModel.h"

@implementation PeersModel

- (id)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        _peerID = [dict objectForKey:@"peerID"];
        _peerName = [dict objectForKey:@"peerName"];
        _state = [[dict objectForKey:@"state"] integerValue];
    }
    return self;

}

@end
