//
//  Map.m
//  MovingGuy
//
//  Created by Taylor Solon on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Map.h"
#import "HelloWorldLayer.h"

// The purpose of this class is to provide a map for Spongebob.
// It is used not only to decide color and obstacle position, but
// also to orient the MiniMap.
@implementation Map

@synthesize array;
@synthesize xSize;
@synthesize ySize;
@synthesize xNow;
@synthesize yNow;

// Initializes a Map with x and y sizes (2DMutableArray).
// Sets xNow and yNow to center position on map.
// Uses an algorithm to help scale coloring based on map size.
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
