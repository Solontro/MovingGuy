//
//  HelloWorldLayer.h
//  MovingGuy
//
//  Created by Taylor Solon on 7/5/12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "Obstacle.h"
#import "Map.h"
#import "MiniMap.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayerColor
{
    CGPoint loc;
    CGPoint firstTouch;
}

@property (retain, nonatomic) Obstacle *obstacle;
@property (retain, nonatomic) CCSprite *joystick;
@property (retain, nonatomic) CCSprite *spongebob;
@property (retain, nonatomic) MiniMap *mm;
@property (retain, nonatomic) Map *map;
@property (nonatomic) BOOL hasObstacle;
- (void)addObstacle;

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
