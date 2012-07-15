//
//  HelloWorldLayer.m
//  MovingGuy
//
//  Created by Taylor Solon on 7/5/12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"



// HelloWorldLayer implementation
// This class controls the main layer.
@implementation HelloWorldLayer

@synthesize joystick;
@synthesize spongebob;
@synthesize hasObstacle;
@synthesize obstacle;
@synthesize map;
@synthesize mm;

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// Initializes class with spongebob image, joystick, and minimap,
// appropriately allocating z values.
-(id) init
{       if( (self=[super initWithColor:ccc4(255,255,255,255)] )){
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        joystick = [CCSprite spriteWithFile:@"Joystick3.png"
                                       rect:CGRectMake(0, 0, 70, 70)];
        joystick.position = ccp(120, 50);
        [self addChild:joystick z:2];
        spongebob = [CCSprite spriteWithFile:@"SB.png"
                                        rect:CGRectMake(0, 0, 92, 140)];
        spongebob.position = ccp(winSize.width/2, winSize.height/2);
        [self addChild:spongebob z:1];
        self.isTouchEnabled = YES;
        map = [[Map alloc] init:11 :11];
        NSNumber *num = [[map.array objectAtIndex:map.xNow] objectAtIndex:map.yNow];
        double c = [num doubleValue];
        [self setColor:ccc3(c, 0, 0)];
        mm = [[MiniMap alloc] init];
        [mm fill:map.xSize :map.ySize :map.xNow :map.yNow];
        [self addChild:mm z:2];
    
    }
    return self;
}

// Adds an obstacle specific to the position on the MiniMap.
// Also removes the old obstacle if the layer has one.
- (void)addObstacle {
    if (self.hasObstacle) [self removeChild:obstacle.sprite cleanup:YES];
    if (map.xNow == map.xSize/2 && map.yNow == map.ySize/2) {
        self.hasObstacle = NO;
        return;
    }
    obstacle = [[Obstacle alloc] init];
    int diffX = 220/map.xSize;
    int diffY = 280/map.ySize;
    int realX = 50 + map.xNow *diffX;
    int realY = 150 + map.yNow *diffY;
    obstacle.sprite.position = ccp(realX, realY);
    [self addChild:obstacle.sprite z:0];
    
}

// Reacts to contact with an obstace depending on the type of obstacle.
// (Knife 'kills', cookie flips, cake turns background blue)
- (void)onContact {
    if (obstacle.type ==1) {
        [self setMain:160 :240];
    }
    else if (obstacle.type ==2) {
        self.color = ccc3(0, 0, 255);
    }
    else if (obstacle.type ==3) {
        if (spongebob.flipY == TRUE) spongebob.flipY = FALSE;
        else spongebob.flipY = TRUE;
    }
}

// Returns to the 'main' screen (the middle of the MiniMap
// Also removes obstacles.
- (void)setMain:(int)x :(int)y {
    NSNumber *num = [[map.array objectAtIndex:map.xSize/2] objectAtIndex:map.ySize/2];
    double c = [num doubleValue];
    [self setColor:ccc3(c, 0, 0)];
    spongebob.position = ccp(x,y);
    map.xNow = map.xSize/2;
    map.yNow = map.ySize/2;
    [self removeChild:obstacle.sprite cleanup:YES];
    self.hasObstacle = NO;
}


// Reacts to touch event on the joystick.
// Reacts differently based on location of Spongebob, using the MiniMap.
// If Spongebob collides with an obstacle, calls |onContact|.
- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    loc = [touch locationInView:[touch view]];
    CCSprite *sb = spongebob;    
    int offX = loc.x - joystick.position.x;
    int offY = (480 - loc.y) - joystick.position.y;
    float time = .09;
    int realX = sb.position.x + offX;
    int realY = sb.position.y + offY;
    if (sqrtf(offX*offX + offY*offY)>35) return;
    if (self.hasObstacle) {
        CGRect sponge = CGRectMake(realX - 46, realY - 70, 92, 140);
        CGRect ob = CGRectMake(obstacle.sprite.position.x - 25, 
                               obstacle.sprite.position.y - 25, 50, 50);
        if (CGRectIntersectsRect(sponge, ob)) {
            [self onContact];
            return;
        }
    }
    if (realX < 0)
    {   if  (map.xNow != 0) {   
            spongebob.position = ccp(320, realY);
            map.xNow --;
            NSNumber *num = [[map.array objectAtIndex:map.xNow] objectAtIndex:map.yNow];
            double c = [num doubleValue];
            [self setColor:ccc3(c, 0, 0)];
            [self addObstacle];
            self.hasObstacle = true;
            [mm fill:map.xSize :map.ySize :map.xNow :map.yNow];
            return;
        }
        return;
    }
    if (realX >320)
    {   if (map.xNow != map.xSize-1) {
            spongebob.position = ccp(0, realY);
            map.xNow ++;
            NSNumber *num = [[map.array objectAtIndex:map.xNow] objectAtIndex:map.yNow];
            double c = [num doubleValue];
            self.color = ccc3(c, 0, 0);
            [self addObstacle];
            self.hasObstacle = true;
            [mm fill:map.xSize :map.ySize :map.xNow :map.yNow];
            return;
        }
        return;
    }
    if (realY < 0)
    {   if (map.yNow != map.ySize-1) {
            spongebob.position = ccp(realX, 480);
            map.yNow ++;
            NSNumber *num = [[map.array objectAtIndex:map.xNow] objectAtIndex:map.yNow];
            double c = [num doubleValue];
            self.color = ccc3(c, 0, 0);
            [self addObstacle];
            self.hasObstacle = true;
            [mm fill:map.xSize :map.ySize :map.xNow :map.yNow];
            return;
        }
        return;
    }
    if (realY > 480)
    {   if (map.yNow != 0) {
            spongebob.position = ccp(realX, 0);
            map.yNow --;
            NSNumber *num = [[map.array objectAtIndex:map.xNow] objectAtIndex:map.yNow];
            double c = [num doubleValue];
            self.color = ccc3(c, 0, 0);
            [self addObstacle];
            self.hasObstacle = true;
            [mm fill:map.xSize :map.ySize :map.xNow :map.yNow];
            return;
        }
        return;
    }
    [sb runAction:[CCSequence actions:
                   [CCMoveTo actionWithDuration:time position:ccp(realX, realY)],
                   [CCCallFuncN actionWithTarget:self selector:@selector(spriteMoveFinished:)],
                   nil]];
}

// Completely unnecessary but I thought I might want this
// for future use (to make something happen after Spongebob moves.
-(void)spriteMoveFinished:(id)sender {
    return;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
