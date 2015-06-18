//
//  ConnectionManager.h
//  peerToPeer
//
//  Created by v_stepanov on 17.06.15.
//  Copyright (c) 2015 v_stepanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MultipeerConnectivity/MultipeerConnectivity.h>

@interface ConnectionManager : NSObject <MCSessionDelegate>

@property (nonatomic, strong) MCPeerID *peerID;
@property (nonatomic, strong) MCSession *session;
@property (nonatomic, strong) MCBrowserViewController *browser;
@property (nonatomic, strong) MCAdvertiserAssistant *advertiser;

-(void)setupMCBrowser;
-(void)setupPeerAndSessionWithDisplayName:(NSString *)displayName;
-(void)advertiseSelf:(BOOL)shouldAdvertise;

@end
