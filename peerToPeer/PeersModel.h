//
//  Peers.h
//  peerToPeer
//
//  Created by v_stepanov on 18.06.15.
//  Copyright (c) 2015 v_stepanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MultipeerConnectivity/MCPeerID.h>

@interface PeersModel : NSObject

@property (strong, nonatomic) MCPeerID *peerID;
@property (assign, nonatomic) NSInteger state;
@property (strong, nonatomic) NSString *peerName;

- (id)initWithDictionary:(NSDictionary *)dict;

@end
