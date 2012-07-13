//
//  MiniMap.m
//  MovingGuy
//
//  Created by Taylor Solon on 7/13/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "MiniMap.h"
#import "Map.h"
#import "HelloWorldLayer.h"

@implementation MiniMap

-(id) init
{
    if( (self=[super initWithColor:ccc4(255,50,50,255)] )){
        [self changeWidth:100 height:100];
        self.position = ccp(220,0);
    }
    return self;
}

-(void) fill: (int)xSize :(int)ySize :(int)xNow :(int)yNow {
    for (int i = 0; i < xSize; i++) {
        for (int j = 0; j < ySize; j++) {
            double diff = 80/(xSize-1);
            double realX = 10+(i*diff);
            double realY = 90-(j*diff);
            CCSprite *dot;
            if (i == xNow && j == yNow) {
                dot = [[CCSprite alloc] initWithFile:@"BlueDot.png"];
            }
            else dot = [[CCSprite alloc] initWithFile:@"BlackDot.png"];
            dot.position = ccp(realX, realY);
            [self addChild:dot];
        }
    }
    
}  

@end
