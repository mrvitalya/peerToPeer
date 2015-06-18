//
//  ConnectionManager.m
//  peerToPeer
//
//  Created by v_stepanov on 17.06.15.
//  Copyright (c) 2015 v_stepanov. All rights reserved.
//

#import "ConnectionManager.h"
#import "PeersModel.h"

@implementation ConnectionManager

-(id)init{
    self = [super init];
    
    if (self) {
        self.peerID = nil;
        self.session = nil;
        self.browser = nil;
        self.advertiser = nil;
    }
    
    return self;
}

-(void)setupPeerAndSessionWithDisplayName:(NSString *)displayName
{
    self.peerID = [[MCPeerID alloc] initWithDisplayName:displayName];
    
    self.session = [[MCSession alloc] initWithPeer:self.peerID];
    self.session.delegate = self;
}

-(void)setupMCBrowser
{
    self.browser = [[MCBrowserViewController alloc] initWithServiceType:@"my-stream" session:self.session];
}

-(void)advertiseSelf:(BOOL)shouldAdvertise
{
    if (shouldAdvertise) {
        self.advertiser = [[MCAdvertiserAssistant alloc] initWithServiceType:@"my-stream"
                                                           discoveryInfo:nil
                                                                 session:self.session];
        [self.advertiser start];
    } else {
        [self.advertiser stop];
        self.advertiser = nil;
    }
}

-(void)session:(MCSession *)session peer:(MCPeerID *)peerID didChangeState:(MCSessionState)state
{
    
    NSDictionary *dict = @{@"peerID": peerID,
                           @"peerName":peerID.displayName,
                           @"state" : [NSNumber numberWithInt:state]
                           };
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"MCDidChangeStateNotification"
                                                        object:nil
                                                      userInfo:dict];
}

-(void)session:(MCSession *)session didReceiveData:(NSData *)data fromPeer:(MCPeerID *)peerID
{
    
}

-(void)session:(MCSession *)session didStartReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID withProgress:(NSProgress *)progress
{
    
}

-(void)session:(MCSession *)session didFinishReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID atURL:(NSURL *)localURL withError:(NSError *)error
{
    
}

-(void)session:(MCSession *)session didReceiveStream:(NSInputStream *)stream withName:(NSString *)streamName fromPeer:(MCPeerID *)peerID
{
    
}

@end
