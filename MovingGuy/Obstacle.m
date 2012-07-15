//
//  Obstacle.m
//  MovingGuy
//
//  Created by Taylor Solon on 7/6/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Obstacle.h"
#import "HelloWorldLayer.h"

// The purpose of this class is to interact with Spongebob
// as he moves, essentially being obstacles with special
// reactions to contact with Spongebob.
@implementation Obstacle

@synthesize type;
@synthesize sprite;

// Initializes an obstacle with a random image (knife, cake, or cookie).
// Also sets the obstacles type appropriately.
- (id)init {
    int choice = (arc4random()%3)+1;
    if (choice == 1 ) {
        sprite = [[CCSprite alloc] initWithFile:@"Knife.png" rect:CGRectMake(0, 0, 50, 50)];
        type = 1;
        return self;
    }
    if (choice == 2) {
        sprite = [[CCSprite alloc] initWithFile:@"Cake2.png" rect:CGRectMake(0, 0, 50, 50)];
        type = 2;
        return self;
    }
    if (choice == 3) {
        sprite = [[CCSprite alloc] initWithFile:@"Cookie.png" rect:CGRectMake(0, 0, 50, 50)];
        type = 3;
        return self;
    }
    else return NULL;
}




@end
