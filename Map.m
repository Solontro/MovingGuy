//
//  Map.m
//  MovingGuy
//
//  Created by Taylor Solon on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Map.h"
#import "HelloWorldLayer.h"

@implementation Map

@synthesize array;
@synthesize xSize;
@synthesize ySize;
@synthesize xNow;
@synthesize yNow;

- (id)init:(int)x :(int)y {
    NSMutableArray *outer = [[NSMutableArray alloc] initWithCapacity:xSize];
    xSize = x;
    ySize = y;
    xNow = x/2;
    yNow = y/2;
    for (int i = 0; i < xSize; i++) {
        NSMutableArray *inner = [[NSMutableArray alloc] initWithCapacity:ySize];
        for (int j = 0; j < ySize; j++) {
            int xDis = abs(i-(x/2));
            int yDis = abs(j-(y/2));
            int num = 255;
            if (xDis > yDis) num = xDis;
            else num = yDis;
            double diff = 255/(xNow + 1);
            double c = 255-diff*num;
            NSNumber *n = [NSNumber numberWithInt:c];
            [inner addObject:n];
        }
    [outer addObject:inner];
    }
    array = outer;
    return self;
}



@end
