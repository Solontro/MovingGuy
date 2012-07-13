//
//  Map.h
//  MovingGuy
//
//  Created by Taylor Solon on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Map : NSObject

@property NSMutableArray *array;
@property int xSize;
@property int ySize;
@property int xNow;
@property int yNow;

- (id)init:(int)x :(int)y;

@end
