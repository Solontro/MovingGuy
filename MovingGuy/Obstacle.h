//
//  Obstacle.h
//  MovingGuy
//
//  Created by Taylor Solon on 7/6/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Obstacle : CCNode {

    int type;
    CCSprite *sprite;
}

@property int type;
@property (retain, nonatomic) CCSprite *sprite;

@end
