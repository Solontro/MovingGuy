//
//  Obstacle.m
//  MovingGuy
//
//  Created by Taylor Solon on 7/6/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Obstacle.h"
#import "HelloWorldLayer.h"


@implementation Obstacle

@synthesize type;
@synthesize sprite;


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
